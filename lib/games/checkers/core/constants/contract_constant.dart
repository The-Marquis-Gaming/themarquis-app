import 'package:starknet/starknet.dart';

class ContractConstants {
  static final contractAddress = Felt.fromString('0x06171ed98331e849d6084bf2b3e3186a7ddf35574dd68cab4691053ee8ab69d7');
  static final providerUrl = Uri.parse('https://starknet-sepolia.public.blastapi.io/rpc/v0_7');
  static final chainId = StarknetChainId.testNet;
}