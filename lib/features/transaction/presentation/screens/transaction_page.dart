import 'package:flutter/material.dart';
import 'package:piggy/features/transaction/data/provider/transaction_provider.dart';
import 'package:piggy/features/transaction/presentation/widgets/transaction_group_widget.dart';
import 'package:provider/provider.dart';

import '../../data/models/group_transaction_model.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<TransactionProvider>(
      builder: (context, transaction, child) => CustomScrollView(
        slivers: buildTransactionGroup(transaction.transactions),
      ),
    );
  }

  List<Widget> buildTransactionGroup(List<GroupTransactionModel> groupItem) {
    return groupItem
        .map((item) => TransactionGroupWidget(
            transactionHeader: item.title, transactionList: item.items))
        .toList();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
