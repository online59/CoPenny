import 'package:flutter/cupertino.dart';
import 'package:piggy/src/features/transaction/controller/repository/trans_repo.dart';
import 'package:piggy/src/features/transaction/model/transaction_group_model.dart';
import '../datasource/transaction_data.dart';

class TransactionProvider extends ChangeNotifier
    implements TransRepository {

  static late TransDataSource dataSource;

  TransactionProvider() {
    dataSource = TransDataSource();
  }

  @override
  List<TransGroupModel> getTransaction(String walletId) {
    var items = _sortedData(dataSource.generateDummyTransaction(walletId));
    notifyListeners();
    return items;
  }

  List<TransGroupModel> _sortedData(List<TransGroupModel> listItems) {
    listItems.sort((a, b) => b.header.compareTo(a.header));
    return listItems;
  }
}
