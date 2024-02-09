import 'package:flutter/material.dart';
import 'package:piggy/src/common_widget/tabs/custom_tab_bar_widget.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/features/core/screen/balance/widgets/line_chart_widget.dart';
import 'package:piggy/src/features/core/screen/balance/widgets/transaction_builder_widget.dart';
import 'package:piggy/src/features/core/screen/balance/widgets/wallet_balance_chart.dart';

class WalletBalanceScreen extends StatefulWidget {
  const WalletBalanceScreen({super.key});

  @override
  _WalletBalanceScreenState createState() => _WalletBalanceScreenState();
}

class _WalletBalanceScreenState extends State<WalletBalanceScreen> with TickerProviderStateMixin{
  final List<Map<String, dynamic>> expenses = [
    {'name': 'Groceries', 'value': '1,200฿'},
    {'name': 'Transportation', 'value': '300฿'},
    {'name': 'Rent', 'value': '10,000฿'},
    {'name': 'Utilities', 'value': '1,500฿'},
    {'name': 'Dining Out', 'value': '800฿'},
    {'name': 'Entertainment', 'value': '600฿'},
    {'name': 'Healthcare', 'value': '2,000฿'},
    {'name': 'Insurance', 'value': '1,200฿'},
    {'name': 'Education', 'value': '3,000฿'},
    {'name': 'Miscellaneous', 'value': '500฿'},
  ];

  final List<Map<String, dynamic>> incomes = [
    {'name': 'Salary', 'value': '50,000฿'},
    {'name': 'Freelance Work', 'value': '5,000฿'},
    {'name': 'Investment Income', 'value': '2,500฿'},
    {'name': 'Rental Income', 'value': '8,000฿'},
    {'name': 'Selling Goods', 'value': '3,500฿'},
    {'name': 'Interest Income', 'value': '1,200฿'},
    {'name': 'Gifts', 'value': '300฿'},
    {'name': 'Refunds', 'value': '600฿'},
    {'name': 'Bonuses', 'value': '2,000฿'},
    {'name': 'Tips', 'value': '400฿'},
  ];

  late final TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: const WalletBalanceChart(
              barTitle: '37,800฿',
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: const LineChartWidget()),
          const SizedBox(height: mVSpacingMedium),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                title:  CustomTabBarWidget(
                  tabController: _tabController,
                  labelPadding: const EdgeInsets.symmetric(horizontal: mPaddingMedium),
                  tabs: const [
                    Tab(text: 'Expenses'),
                    Tab(text: 'Incomes'),
                  ],
                ),
              ),
              body: TabBarView(
                controller: _tabController,
                children: [
                  TransactionListBuilder(transactionItems: expenses),
                  TransactionListBuilder(transactionItems: incomes)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
