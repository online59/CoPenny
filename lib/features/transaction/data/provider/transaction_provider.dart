import 'package:flutter/cupertino.dart';
import 'package:piggy/features/transaction/data/repository/trans_repo.dart';

import '../../domain/models/transaction_header_model.dart';
import '../datasource/transaction_data.dart';

class TransactionProvider extends ChangeNotifier
    implements TransRepository {
  TransactionProvider._internal();

  static final TransactionProvider _instance =
      TransactionProvider._internal();
  static late TransDataSource dataSource;

  factory TransactionProvider() {
    dataSource = TransDataSource();
    return _instance;
  }

  @override
  List<TransHeaderModel> getTransaction(String walletId) {
    var items = _sortedData(dataSource.generateDummyTransaction(walletId));
    notifyListeners();
    return items;
  }

  List<TransHeaderModel> _sortedData(List<TransHeaderModel> listItems) {
    listItems.sort((a, b) => b.header.compareTo(a.header));
    return listItems;
  }
}
