import '../../domain/model/wallet_model.dart';

class WalletDataSource {
  List<WalletModel> generateDummyWallet() => List<WalletModel>.generate(
        5,
        (index) => WalletModel("walletId$index", "wallet $index"),
      ).toList();
}
