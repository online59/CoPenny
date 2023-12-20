import 'package:piggy/features/transaction/data/models/transaction_item_model.dart';

class GroupTransactionModel {
  final DateTime title;
  final List<TransactionItemModel> items;

  GroupTransactionModel(this.title, this.items);
}