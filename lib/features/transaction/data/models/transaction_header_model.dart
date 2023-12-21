import 'package:piggy/features/transaction/data/models/transaction_item_model.dart';

class TransHeaderModel {
  final DateTime title;
  final List<TransItemModel> items;

  TransHeaderModel(this.title, this.items);
}