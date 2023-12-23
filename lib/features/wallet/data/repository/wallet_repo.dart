import '../../domain/model/wallet_model.dart';

abstract class WalletRepository {
  List<WalletModel> getAll();
}