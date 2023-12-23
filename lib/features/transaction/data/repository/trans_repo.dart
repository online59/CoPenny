

import '../../domain/models/transaction_group_model.dart';

abstract class TransRepository {
  List<TransGroupModel> getTransaction(String walletId);
}