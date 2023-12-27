import 'package:flutter/cupertino.dart';
import 'package:piggy/src/features/wallet/controller/repository/wallet_repo.dart';
import 'package:piggy/src/features/wallet/model/wallet_model.dart';

import '../datasource/wallet_data_source.dart';

class WalletProvider extends ChangeNotifier implements WalletRepository {
  String _currentWalletId = '';
  String _currentWalletName = '';
  String _currentWalletBalance = '';

  bool hasError = false;
  bool hasData = false;

  late WalletDataSource dataSource;

  WalletProvider() {
    dataSource = WalletDataSource();
  }

  @override
  List<WalletModel> getAll() {

    List<WalletModel> listItem = [];

    try {
      listItem = dataSource.generateDummyWallet();
      hasData = true;
    } catch (e) {
      hasError = true;
    }

    notifyListeners();
    return listItem;
  }




  String get currentWalletId => _currentWalletId;

  set currentWalletId(String value) {
    _currentWalletId = value;
    notifyListeners();
  }

  String get currentWalletName => _currentWalletName;

  set currentWalletName(String value) {
    _currentWalletName = value;
    notifyListeners();
  }

  String get currentWalletBalance => _currentWalletBalance;

  set currentWalletBalance(String value) {
    _currentWalletBalance = value;
    notifyListeners();
  }
}
