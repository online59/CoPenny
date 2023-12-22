import 'package:flutter/material.dart';
import 'package:piggy/features/transaction/data/provider/trans_repo_provider.dart';
import 'package:piggy/features/transaction/presentation/widgets/transaction_card_widget.dart';
import 'package:provider/provider.dart';

import '../../domain/models/transaction_header_model.dart';


class ShowTransactionPage extends StatefulWidget {
  const ShowTransactionPage({super.key, required this.walletId});

  final String walletId;

  @override
  State<ShowTransactionPage> createState() => _ShowTransactionPageState();
}

class _ShowTransactionPageState extends State<ShowTransactionPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<TransRepositoryProvider>(
      builder: (context, transaction, child) => CustomScrollView(
        slivers: buildTransactionGroup(transaction.getTransaction(widget.walletId)),
      ),
    );
  }

  List<Widget> buildTransactionGroup(List<TransHeaderModel> groupItem) {
    return groupItem
        .map(
          (item) => TransactionCardWidget(
            transHeader: item.getFormattedHeader(),
            transItems: item.items,
            totalAmount: item.getFormattedTotalAmount(),
          ),
        )
        .toList();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
