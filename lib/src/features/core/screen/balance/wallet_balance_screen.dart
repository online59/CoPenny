import 'package:flutter/material.dart';
import 'package:piggy/src/common_widget/containers/gradient_container_widget.dart';
import 'package:piggy/src/constants/sizes.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(mPaddingSmall),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: mVSpacingMedium),
            GradientContainer(
              beginColor: Colors.purple[400]!,
              middleColor: Colors.purple[600]!,
              endColor: Colors.blue[400]!,
              beginColorAlignment: Alignment.bottomLeft,
              endColorAlignment: Alignment.topRight,
              width: double.infinity,
              borderRadius: BorderRadius.circular(mContainerMediumRadius),
              padding: const EdgeInsets.all(mPaddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Balance',
                        style: TextStyle(
                          fontSize: mFontSizeXXLarge,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Last updated 2 hours ago',
                        style: TextStyle(
                          fontSize: mFontSizeSmall,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: mVSpacingMedium),
                  const Text(
                    'THB 50,000.00',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: mVSpacingMedium),
                  Text(
                    'Wallet Name'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: mFontSizeLarge,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      for (final i in Iterable.generate(8))
                        _buildMemberCircleAvatar(i.toString()),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: mVSpacingSmall),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(
                  title: 'Total Income',
                  amount: 'THB 7,000.00',
                  account: 'Bank Account ****1796',
                ),
                SizedBox(
                  width: mHSpacingSmall,
                ),
                InfoCard(
                  title: 'Total Expense',
                  amount: 'THB 4,544.99',
                  account: 'Bank Account ****1965',
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
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
          ],
        ),
      ),
    );
  }

  Widget _buildMemberCircleAvatar(String name) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text(
          name,
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> transactions) {
    return Column(
      children: [
        ListTile(
          title: Text(title, style: const TextStyle(fontSize: mFontSizeXLarge)),
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
                  fontSize: mFontSizeMedium,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: mVSpacingSmall),
              Text(
                amount,
                style: const TextStyle(
                  fontSize: mFontSizeXXLarge,
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
