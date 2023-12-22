import 'package:flutter/cupertino.dart';
import 'package:piggy/features/wallet/data/repository/wallet_repo.dart';
import 'package:piggy/features/wallet/domain/model/wallet_model.dart';

import '../datasource/wallet_data_source.dart';

class WalletRepositoryProvider extends ChangeNotifier implements WalletRepository {

  static final WalletRepositoryProvider _instance = WalletRepositoryProvider._internal();

  WalletRepositoryProvider._internal();

  static late WalletDataSource dataSource;

  factory WalletRepositoryProvider() {
    dataSource = WalletDataSource();
    return _instance;
  }

  @override
  Future<List<WalletModel>> getAll() async {
    var listItem = await dataSource.generateDummyWallet();
    notifyListeners();
    return listItem;
  }

  @override
  Future<WalletModel> getById(String walletId) {
    // TODO: implement getById
    throw UnimplementedError();
  }


}