import 'package:flutter/material.dart';
import 'package:piggy/src/features/core/screen/transaction/widgets/date_transaction_widget.dart';

import '../model/transaction_group_model.dart';

class MonthTransactionWidget extends StatelessWidget {
  const MonthTransactionWidget({super.key, required this.transactionList});

  final List<TransGroupModel> transactionList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: CustomScrollView(
        slivers: buildTransactionBody(context),
      ),
    );
  }

  List<Widget> buildTransactionBody(BuildContext context) {
    List<Widget> widgets = [];
    widgets.addAll(buildDateTransaction());
    return widgets;
  }

  List<Widget> buildDateTransaction() => transactionList
      .map(
        (item) => DateTransactionWidget(
      transHeader: item.getFormattedHeader(),
      transItems: item.items,
      totalAmount: item.getFormattedTotalAmount(),
    ),
  )
      .toList();
}
