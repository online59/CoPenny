import 'package:flutter/cupertino.dart';
import 'package:piggy/features/wallet/data/repository/wallet_repo.dart';
import 'package:piggy/features/wallet/domain/model/wallet_model.dart';

import '../datasource/wallet_data_source.dart';

class WalletProvider extends ChangeNotifier implements WalletRepository {
  String _currentWalletId = '';
  String _currentWalletName = '';
  String _currentWalletBalance = '';

  static final WalletProvider _instance = WalletProvider._internal();

  WalletProvider._internal();

  static late WalletDataSource dataSource;

  factory WalletProvider() {
    dataSource = WalletDataSource();
    return _instance;
  }

  @override
  List<WalletModel> getAll() {
    var listItem = dataSource.generateDummyWallet();
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
