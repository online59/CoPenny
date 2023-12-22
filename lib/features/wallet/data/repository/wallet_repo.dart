import '../../domain/model/wallet_model.dart';

abstract class WalletRepository {
  Future<List<WalletModel>> getAll();

  Future<WalletModel> getById(String walletId);
}