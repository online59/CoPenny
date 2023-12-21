import 'package:flutter/cupertino.dart';
import 'package:piggy/features/transaction/data/datasource/transaction_data.dart';
import 'package:piggy/features/transaction/data/models/transaction_header_model.dart';

class TransProvider extends ChangeNotifier{

  TransRepository repository = TransRepository();

  TransProvider() {
    fetchTransactionData();
  }

  final List<TransHeaderModel> _transactions = [];

  List<TransHeaderModel> get transactions => _transactions;

  Future fetchTransactionData() async {
    await Future.delayed(const Duration(seconds: 1));
    _transactions.addAll(repository.transaction());
    notifyListeners();
  }
}