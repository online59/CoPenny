


import 'package:piggy/src/features/transaction/model/transaction_group_model.dart';

abstract class TransRepository {
  List<TransGroupModel> getTransaction(String walletId);
}