import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marquis_v2/games/checkers/models/checkers_session.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starknet/starknet.dart';
import 'package:starknet_provider/starknet_provider.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

part 'starknet.g.dart';
part 'starknet.freezed.dart';

const _privateKeyStorageKey = 'private_key';
const _storage = FlutterSecureStorage();

@freezed
class StarknetProviderData with _$StarknetProviderData {
  factory StarknetProviderData({
    required JsonRpcProvider provider,
    Account? signerAccount,
  }) = _StarknetProviderData;
}

@Riverpod(keepAlive: true)
class Starknet extends _$Starknet {
  static const String _accountClassHash =
      "0x07dc7899aa655b0aae51eadff6d801a58e97dd99cf4666ee59e704249e51adf2";
  static const String _strkAddress =
      '0x4718F5A0FC34CC1AF16A1CDEE98FFB20C31F5CD61D6AB07201858F4287C938D';

  @override
  StarknetProviderData build() {
    return StarknetProviderData(
      provider: JsonRpcProvider(nodeUri: Uri.parse('http://localhost:5050')),
      signerAccount: null,
    );
  }

  Future<void> initAccount() async {
    try {
      final privateKey = await _storage.read(key: _privateKeyStorageKey);

      if (privateKey != null) {
        final accountAddress =
            await computeAccountAddress(Felt.fromHexString(privateKey));
        // Create signer account
        final account = getAccount(
          accountAddress: Felt.fromHexString(accountAddress),
          privateKey: Felt.fromHexString(privateKey),
          nodeUri: Uri.parse('http://localhost:5050'),
          chainId: Felt.fromHexString((await state.provider.chainId()).when(
            result: (result) => result,
            error: (error) => throw Exception("Failed to get chain ID"),
          )),
        );

        // Update state
        state = state.copyWith(signerAccount: account);
        try {
          (await state.provider.getClassHashAt(
                  contractAddress: Felt.fromHexString(accountAddress),
                  blockId: BlockId.latest))
              .when(
            result: (result) => result,
            error: (error) =>
                throw Exception("Failed to get account class hash"),
          );
        } catch (e) {
          print("account not deployed, generating account");
          await generateAccount();
        }
      } else {
        print("account not found, generating account");
        await generateAccount();
      }
    } catch (e) {
      // Handle initialization error
      print('Failed to initialize Starknet provider: $e');
    }
  }

  Future<void> generateAccount() async {
    final mnemonic = bip39.generateMnemonic();
    final privateKey = derivePrivateKey(mnemonic: mnemonic);
    final accountAddress = await computeAccountAddress(privateKey);
    final signer = Signer(privateKey: privateKey);
    final res = await Account.deployAccount(
      signer: signer,
      provider: state.provider,
      constructorCalldata: [
        signer.publicKey,
      ],
      classHash: Felt.fromHexString(_accountClassHash),
      contractAddressSalt: signer.publicKey,
      nonce: Felt.zero,
    );
    final result = res.when(
      result: (result) => result,
      error: (error) => throw Exception(
          "Failed to deploy merchant account, ${error.toString()}"),
    );
    await Future.delayed(const Duration(seconds: 1));

    await waitForAcceptance(
        transactionHash: result.transactionHash.toHexString(),
        provider: state.provider);

    TxnReceipt receipt;
    while (true) {
      receipt = (await state.provider.getTransactionReceipt(
              Felt.fromHexString(result.transactionHash.toHexString())))
          .when(
        result: (result) => result,
        error: (error) => throw Exception("Failed to get transaction receipt"),
      );
      final finalityStatus = receipt.map(
        declareTxnReceipt: (receipt) => receipt.finality_status,
        deployTxnReceipt: (receipt) => receipt.finality_status,
        deployAccountTxnReceipt: (receipt) => receipt.finality_status,
        l1HandlerTxnReceipt: (receipt) => receipt.finality_status,
        pendingDeployTxnReceipt: (receipt) => 'PENDING',
        pendingCommonReceiptProperties: (receipt) => 'PENDING',
        invokeTxnReceipt: (receipt) => receipt.finality_status,
      );
      if (finalityStatus == 'ACCEPTED_ON_L2') {
        break;
      }
      await Future.delayed(const Duration(seconds: 3));
    }
    state = state.copyWith(
        signerAccount: getAccount(
      accountAddress: Felt.fromHexString(accountAddress),
      privateKey: privateKey,
      nodeUri: Uri.parse('http://localhost:5050'),
      chainId: Felt.fromHexString((await state.provider.chainId()).when(
        result: (result) => result,
        error: (error) => throw Exception("Failed to get chain ID"),
      )),
    ));
    // Store credentials securely
    await _storage.write(
        key: _privateKeyStorageKey, value: privateKey.toHexString());
  }

  Future<String> computeAccountAddress(Felt privateKey) async {
    final publicKey = Signer(privateKey: privateKey).publicKey;
    final accountAddress = Contract.computeAddress(
        classHash: Felt.fromHexString(_accountClassHash),
        calldata: [publicKey],
        salt: publicKey);
    return accountAddress.toHexString();
  }

  Future<void> logout() async {
    await _storage.delete(key: _privateKeyStorageKey);
    state = state.copyWith(signerAccount: null);
  }

  bool get isAuthenticated => state.signerAccount != null;

  Future<Uint256> getStrkBalance() async {
    if (state.signerAccount == null) {
      throw Exception("Signer account is not initialized");
    }
    final balance = await ERC20(
            account: state.signerAccount!,
            address: Felt.fromHexString(_strkAddress))
        .balanceOf(state.signerAccount!.accountAddress);
    return balance;
  }

  // Returns transaction hash on success
  Future<String> createLobby() async {
    if (state.signerAccount == null) {
      throw Exception("Signer account is not initialized");
    }

    final res = await _executeTransaction(
      contractAddress: checkersContract,
      functionName: "create_lobby",
      calldata: [],
    );

    if (res.events.isEmpty ||
        res.events.first.data == null ||
        res.events.first.data!.isEmpty) {
      throw Exception("No session ID returned from contract");
    }

    final sessionId =
        '0x${(res.events.first.data!.last.toInt() - 1).toRadixString(16)}';
    if (kDebugMode) {
      log("Session ID: $sessionId");
    }
    return sessionId;
  }

  // Returns transaction hash on success
  Future<String> joinLobby(int sessionId) async {
    if (state.signerAccount == null) {
      throw Exception("Signer account is not initialized");
    }

    final res = await _executeTransaction(
      contractAddress: checkersContract,
      functionName: "join_lobby",
      calldata: [Felt.fromInt(sessionId)],
    );
    return res.transactionHash.toHexString();
  }

  // Returns current session ID as uint256
  Future<BigInt?> getSessionId() async {
    if (state.signerAccount == null) {
      throw Exception("Signer account is not initialized");
    }

    final res = await _executeTransaction(
      contractAddress: checkersContract,
      functionName: "get_session_id",
    );

    print("get session id events: ${res.events}");

    if (res.events.isEmpty) {
      return null;
    }

    // Parse the response to get session ID as BigInt
    return res.events[0].data!.last.toBigInt();
  }

  // Returns transaction hash on success
  Future<String> spawn({
    required String player,
    required int position, // 0 = None, 1 = Up, 2 = Down
    required int sessionId,
  }) async {
    if (state.signerAccount == null) {
      throw Exception("Signer account is not initialized");
    }

    final res = await _executeTransaction(
      contractAddress: checkersContract,
      functionName: "spawn",
      calldata: [
        Felt.fromString(player),
        Felt.fromInt(position),
        Felt.fromInt(sessionId),
      ],
    );
    return res.transactionHash.toHexString();
  }

  // Returns bool indicating if piece can be chosen
  Future<bool> canChoosePiece({
    required int position,
    required int row,
    required int col,
    required int sessionId,
  }) async {
    if (state.signerAccount == null) {
      throw Exception("Signer account is not initialized");
    }

    final res = await _executeTransaction(
      contractAddress: checkersContract,
      functionName: "can_choose_piece",
      calldata: [
        Felt.fromInt(position),
        Felt.fromInt(row),
        Felt.fromInt(col),
        Felt.fromInt(sessionId),
      ],
    );

    // Parse response to get boolean result (0 = false, 1 = true)
    return res.events[0].data![0].toBigInt() == BigInt.one;
  }

  // Returns transaction hash on success
  Future<String> movePiece({
    required CheckersPiece currentPiece,
    required int targetRow,
    required int targetCol,
  }) async {
    if (state.signerAccount == null) {
      throw Exception("Signer account is not initialized");
    }

    final res = await _executeTransaction(
      contractAddress: checkersContract,
      functionName: "move_piece",
      calldata: [
        // Current piece data
        Felt.fromInt(currentPiece.sessionId),
        Felt.fromInt(currentPiece.row),
        Felt.fromInt(currentPiece.col),
        Felt.fromString(currentPiece.player),
        Felt.fromInt(currentPiece.position),
        Felt.fromInt(currentPiece.isKing ? 1 : 0),
        Felt.fromInt(currentPiece.isAlive ? 1 : 0),
        // Target coordinates
        Felt.fromInt(targetRow),
        Felt.fromInt(targetCol),
      ],
    );
    return res.transactionHash.toHexString();
  }

  // Returns transaction hash on success
  Future<String> worldDispatcher() async {
    if (state.signerAccount == null) {
      throw Exception("Signer account is not initialized");
    }

    final res = await _executeTransaction(
      contractAddress: checkersContract,
      functionName: "world_dispatcher",
    );
    return res.transactionHash.toHexString();
  }

  // Returns the dojo name as string
  Future<String> dojoName() async {
    if (state.signerAccount == null) {
      throw Exception("Signer account is not initialized");
    }

    final res = await _executeTransaction(
      contractAddress: checkersContract,
      functionName: "dojo_name",
    );

    // Parse hex string to UTF-8 string
    final hexString = res.events[0].data![0].toHexString();
    final bytes = List<int>.generate(
      hexString.length ~/ 2,
      (i) => int.parse(hexString.substring(i * 2, (i + 1) * 2), radix: 16),
    );
    return utf8.decode(bytes);
  }

  Future<TxnReceipt> _executeTransaction({
    required String contractAddress,
    required String functionName,
    List<Felt> calldata = const [],
    Felt? nonce,
  }) async {
    if (state.signerAccount == null) {
      throw Exception("Signer account is not initialized");
    }
    final res = await state.signerAccount!.execute(
      // useSTRKFee: true,
      max_fee: Felt.fromInt(0),
      functionCalls: [
        FunctionCall(
          contractAddress: Felt.fromHexString(contractAddress),
          entryPointSelector: getSelectorByName(functionName),
          calldata: calldata,
        ),
      ],
      nonce: nonce,
    );
    final result = res.when(
      result: (result) => result,
      error: (error) =>
          throw Exception("Failed to execute transaction: $error"),
    );
    await waitForAcceptance(
        transactionHash: result.transaction_hash, provider: state.provider);

    TxnReceipt receipt;
    while (true) {
      receipt = (await state.provider.getTransactionReceipt(
              Felt.fromHexString(result.transaction_hash)))
          .when(
        result: (result) => result,
        error: (error) =>
            throw Exception("Failed to get transaction finality status"),
      );
      final finalityStatus = receipt.map(
        declareTxnReceipt: (receipt) => receipt.finality_status,
        deployTxnReceipt: (receipt) => receipt.finality_status,
        deployAccountTxnReceipt: (receipt) => receipt.finality_status,
        l1HandlerTxnReceipt: (receipt) => receipt.finality_status,
        pendingDeployTxnReceipt: (receipt) => 'PENDING',
        pendingCommonReceiptProperties: (receipt) => 'PENDING',
        invokeTxnReceipt: (receipt) => receipt.finality_status,
      );
      if (finalityStatus == 'ACCEPTED_ON_L2') {
        break;
      }
      await Future.delayed(const Duration(seconds: 3));
    }
    return receipt;
  }
}

// Constants
const String checkersContract =
    "0x50250faf40cba04ea20c61ce22e98bcde324399c231e98520cf1205563fba9a";
