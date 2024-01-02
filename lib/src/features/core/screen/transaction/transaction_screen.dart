import 'package:flutter/material.dart';
import 'package:piggy/src/common_widget/appbars/sliver_pinned_app_bar.dart';
import 'package:piggy/src/features/core/screen/transaction/transaction_data.dart';
import 'package:piggy/src/features/core/screen/transaction/widgets/wallet_balanace_header_widget.dart';
import 'package:piggy/src/features/core/screen/transaction/widgets/transaction_group.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen>
    with AutomaticKeepAliveClientMixin {
  var transactionList = TransDataSource().generateDummyTransaction("dummy");

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return CustomScrollView(slivers: buildSliverBody());
  }

  List<Widget> buildSliverBody() {
    List<Widget> widgets = [];
    widgets.add(const SliverPinnedAppBarWidget(
      expandedHeight: 250.0,
      child: WalletBalanceHeaderWidget(),
    ));
    widgets.addAll(buildTransactionCards());
    return widgets;
  }

  List<Widget> buildTransactionCards() => transactionList
      .map(
        (item) => TransactionGroup(
          transHeader: item.getFormattedHeader(),
          transItems: item.items,
          totalAmount: item.getFormattedTotalAmount(),
        ),
      )
      .toList();

  @override
  bool get wantKeepAlive => true;
}

