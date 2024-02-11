import 'package:flutter/material.dart';
import 'package:piggy/src/common_widget/containers/border_container_widget.dart';
import 'package:piggy/src/common_widget/containers/gradient_container_widget.dart';
import 'package:piggy/src/common_widget/tabs/custom_tab_bar_widget.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/features/core/screen/balance/widgets/line_chart_widget.dart';
import 'package:piggy/src/features/core/screen/balance/widgets/transaction_builder_widget.dart';
import 'package:piggy/src/features/core/screen/balance/widgets/bar_graph_widget.dart';

class WalletBalanceScreen extends StatefulWidget {
  const WalletBalanceScreen({super.key});

  @override
  _WalletBalanceScreenState createState() => _WalletBalanceScreenState();
}

class _WalletBalanceScreenState extends State<WalletBalanceScreen>
    with TickerProviderStateMixin {
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
          const SizedBox(height: mVSpacingMedium),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: mPaddingSmall),
            child: GradientContainer(
              width: double.infinity,
              borderRadius: BorderRadius.circular(mContainerMediumRadius),
              padding: const EdgeInsets.all(mPaddingMedium),
              child: const Column(
                children: [
                  Text(
                    'Total Balance',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '฿ 50,000.00',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Last updated 2 hours ago',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(mPaddingSmall),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(
                  title: 'Total Income',
                  amount: '\$7,000.00',
                  account: 'Bank Account ****1796',
                ),
                SizedBox(
                  width: mHSpacingSmall,
                ),
                InfoCard(
                  title: 'Total Expense',
                  amount: '\$4,544.99',
                  account: 'Bank Account ****1965',
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Padding(
              padding: const EdgeInsets.all(mPaddingSmall),
              child: Column(
                children: [
                  _buildSection('Top Outflow', [
                    _buildTransaction('Home Loan', 'Mon Apr, 2022', -1540,
                        isExpense: true),
                    _buildTransaction('Bill Payments', 'Thu Apr, 2022', -1479,
                        isExpense: true),
                    _buildTransaction(
                        'Supermarket Shopping', 'Wed Apr, 2022', -479,
                        isExpense: true),
                  ]),
                  _buildSection('Top Inflow', [
                    _buildTransaction(
                        'Freelance Payment', 'Sat Apr, 2022', 2252,
                        isExpense: false),
                    _buildTransaction('Salary', 'Mon Apr, 2022', 8500,
                        isExpense: false),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> transactions) {
    return Column(
      children: [
        ListTile(
          title: Text(title, style: const TextStyle(fontSize: 18)),
          trailing: const Text('See All'),
          tileColor: Colors.transparent,
        ),
        ...transactions,
      ],
    );
  }

  Widget _buildTransaction(String description, String date, double amount,
      {bool isExpense = false}) {
    final color = amount < 0 ? Colors.red : Colors.green;
    return Card(
      child: ListTile(
        leading: isExpense
            ? const Icon(Icons.arrow_downward, color: Colors.red)
            : const Icon(Icons.arrow_upward, color: Colors.green),
        title: Text(description),
        subtitle: Text(date),
        trailing: Text('\$${amount.toStringAsFixed(2)}',
            style: TextStyle(color: color)),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String amount;
  final String account;

  const InfoCard({
    super.key,
    required this.title,
    required this.amount,
    required this.account,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GradientContainer(
        beginColor: Colors.green[400]!,
        endColor: Colors.green[600]!,
        borderRadius: BorderRadius.circular(mContainerMediumRadius),
        padding: const EdgeInsets.all(mPaddingSmall),
        child: Padding(
          padding: const EdgeInsets.all(mPaddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: mVSpacingSmall),
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
