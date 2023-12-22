import '../../domain/model/wallet_model.dart';

class WalletDataSource {
  Future<List<WalletModel>> generateDummyWallet() async {
    Future.delayed(const Duration(seconds: 1));
    return List<WalletModel>.generate(
      5,
          (index) => WalletModel("walletId$index", "wallet $index"),
    ).toList();
  }
}
