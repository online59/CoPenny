

import '../../domain/models/transaction_header_model.dart';

abstract class TransRepository {
  Future<List<TransHeaderModel>> getTransaction(String walletId);
}