import 'package:piggy/src/features/wallet/model/wallet_model.dart';

abstract class WalletRepository {
  List<WalletModel> getAll();
}