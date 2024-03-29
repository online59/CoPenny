import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:piggy/src/features/core/screen/transaction/transaction_data.dart';
import 'package:piggy/src/common_widget/tabs/custom_tab_bar_widget.dart';
import 'package:piggy/src/features/core/screen/transaction/widgets/month_transaction_widget.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  var transactionList = TransDataSource().generateDummyTransaction("dummy");
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 12, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        shape: Border.all(
          color: Colors.transparent,
          width: 0.0,
        ),
        title: CustomTabBarWidget(
          isScrollable: true,
          tabController: _tabController,
          tabAlignment: TabAlignment.start,
          tabs: [
            for (int i = 0; i < 12; i++)
              Tab(
                text: getMonthName(i + 1).toUpperCase(),
              ),
          ],
        ),
      ),
      body: TabBarView(
        clipBehavior: Clip.antiAlias,
        controller: _tabController,
        dragStartBehavior: DragStartBehavior.start,
        children: [
          for (int i = 0; i < 12; i++)
            MonthTransactionWidget(
              transactionList: transactionList,
            ),
        ],
      ),
    );
  }

  String getMonthName(int monthNumber, {int year = 2024}) {
    // Create an instance of DateFormat with desired format
    DateFormat formatter = DateFormat('MMM yyyy');

    // Get the DateTime object for the first day of the specified month
    DateTime dateTime = DateTime(year, monthNumber, 1);

    // Format the DateTime object to get the month name
    String monthName = formatter.format(dateTime);

    return monthName;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
