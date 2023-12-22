import 'package:flutter/cupertino.dart';
import 'package:piggy/features/transaction/data/repository/trans_repo.dart';

import '../../domain/models/transaction_header_model.dart';
import '../datasource/transaction_data.dart';

class TransRepositoryProvider extends ChangeNotifier implements TransRepository {
  TransRepositoryProvider._internal();

  static final TransRepositoryProvider _instance = TransRepositoryProvider._internal();
  static late TransDataSource dataSource;

  factory TransRepositoryProvider() {
    dataSource = TransDataSource();
    return _instance;
  }

  @override
  List<TransHeaderModel> getTransaction(String walletId) {
    return _sortedData(dataSource.generateDummyTransaction(walletId));
  }

  List<TransHeaderModel> _sortedData(List<TransHeaderModel> listItems) {
    listItems.sort((a, b) => b.header.compareTo(a.header));
    return listItems;
  }
}
