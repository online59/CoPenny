

import '../../domain/models/transaction_header_model.dart';

abstract class TransRepository {
  List<TransHeaderModel> getTransaction(String walletId);
}