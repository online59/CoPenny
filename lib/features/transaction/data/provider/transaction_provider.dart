import 'package:flutter/cupertino.dart';
import 'package:piggy/features/transaction/data/datasource/transaction_data.dart';
import 'package:piggy/features/transaction/data/models/group_transaction_model.dart';

class TransactionProvider extends ChangeNotifier{

  TransactionProvider() {
    fetchTransactionData();
  }

  final List<GroupTransactionModel> _transactions = [];

  List<GroupTransactionModel> get transactions => _transactions;

  Future fetchTransactionData() async {
    await Future.delayed(const Duration(seconds: 1));
    _transactions.addAll(TransactionRepository.transaction);
    notifyListeners();
  }
}