import '../../domain/model/wallet_model.dart';

class WalletDataSource {
  List<WalletModel> generateDummyWallet() {
    Future.delayed(const Duration(seconds: 1));
    return List<WalletModel>.generate(
      5,
          (index) => WalletModel("walletId$index", "wallet $index", 5000),
    ).toList();
  }
}
