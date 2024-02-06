import 'package:flutter/material.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/features/core/screen/balance/widgets/transaction_builder_widget.dart';
import 'package:piggy/src/features/core/screen/balance/widgets/wallet_balance_chart.dart';

enum ButtonState { expense, income }

class WalletBalanceScreen extends StatefulWidget {
  const WalletBalanceScreen({super.key});

  @override
  _WalletBalanceScreenState createState() => _WalletBalanceScreenState();
}

class _WalletBalanceScreenState extends State<WalletBalanceScreen> {
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

  ButtonState _selectedSegmentButton =
      ButtonState.expense; // 0 for expenses, 1 for incomes

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: const WalletBalanceChart(),
          ),
          const SizedBox(height: 20),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Expanded(
          //         child: InkWell(
          //           onTap: () {
          //             setState(() {
          //               _selectedSegmentButton = ButtonState.expense;
          //             });
          //           },
          //           child: Container(
          //             alignment: Alignment.center,
          //             decoration: BoxDecoration(
          //               color: _selectedSegmentButton == ButtonState.expense
          //                   ? Theme.of(context).primaryColor
          //                   : Theme.of(context).disabledColor,
          //               borderRadius: BorderRadius.circular(20),
          //             ),
          //             child: const Padding(
          //               padding: EdgeInsets.symmetric(vertical: 10),
          //               child: Text(
          //                 'Expenses',
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //       const SizedBox(width: 20),
          //       Expanded(
          //         child: InkWell(
          //           onTap: () {
          //             setState(() {
          //               _selectedSegmentButton = ButtonState.income;
          //             });
          //           },
          //           child: Container(
          //             alignment: Alignment.center,
          //             decoration: BoxDecoration(
          //               color: _selectedSegmentButton == ButtonState.income
          //                   ? Theme.of(context).primaryColor
          //                   : Theme.of(context).disabledColor,
          //               borderRadius: BorderRadius.circular(20),
          //             ),
          //             child: const Padding(
          //               padding: EdgeInsets.symmetric(vertical: 10),
          //               child: Text(
          //                 'Incomes',
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  title: const TabBar(
                    // labelColor: Theme.of(context).colorScheme.onPrimary,
                    // indicator: BoxDecoration(
                    //   color: Theme.of(context).colorScheme.primary,
                    //   borderRadius: BorderRadius.circular(mContainerMediumRadius),
                    // ),
                    tabs: [
                      Tab(text: 'Expenses'),
                      Tab(text: 'Incomes'),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    TransactionListBuilder(transactionItems: expenses),
                    TransactionListBuilder(transactionItems: incomes)
                  ],
                ),
              ),
            ),
          ),
          // const SizedBox(height: 20),
          // _selectedSegmentButton == ButtonState.expense
          //     ? TransactionListBuilder(transactionItems: expenses)
          //     : TransactionListBuilder(transactionItems: incomes),
        ],
      ),
    );
  }
}
