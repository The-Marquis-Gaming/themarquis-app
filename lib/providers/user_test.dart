import 'package:marquis_v2/models/user.dart';
import 'package:marquis_v2/providers/user.dart';

class UserTest extends User {
  UserTest() : super();

  @override
  UserData? build() {
    return null;
  }

  void setUser() {
    state = UserData(
      id: "0",
      email: "test@test.com",
      role: "testRole",
      status: "testStatus",
      points: 100,
      referredBy: "testReferredBy",
      referralId: 0,
      walletId: 0,
      profileImageUrl: "testProfileImageUrl",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      referralCode: "testReferralCode",
      accountAddress: "testAccountAddress",
      sessionId: null,
    );
  }

  void setSessionId(String? id) {
    state = state!.copyWith(sessionId: id);
  }

  @override
  Future<void> getUser() async {
    state = UserData(
      id: "0",
      email: "test@test.com",
      role: "testRole",
      status: "testStatus",
      points: 100,
      referredBy: "testReferredBy",
      referralId: 0,
      walletId: 0,
      profileImageUrl: "testProfileImageUrl",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      referralCode: "testReferralCode",
      accountAddress: "testAccountAddress",
      sessionId: null,
    );
  }

  @override
  Future<List<Map<String, String>>> getSupportedTokens() async {
    return [
      {
        "address":
            "0x04718f5a0fc34cc1af16a1cdee98ffb20c31f5cd61d6ab07201858f4287c938d",
        "name": "STRK"
      },
      {
        "address":
            "0x049d36570d4e46f48e99674bd3fcc84644ddd6b96f7c741b1562b82f9e004dc7",
        "name": "ETH"
      }
    ];
  }

  @override
  Future<BigInt> getTokenBalance(String tokenAddress) async {
    return BigInt.from(1000000000000000000);
  }
}
