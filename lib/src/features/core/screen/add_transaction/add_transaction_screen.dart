import 'package:flutter/material.dart';
import 'package:piggy/src/common_widget/tabs/custom_tab_bar_widget.dart';
import 'package:piggy/src/constants/sizes.dart';

class TransactionBottomSheetWidget extends StatefulWidget {
  const TransactionBottomSheetWidget({super.key});

  @override
  State<TransactionBottomSheetWidget> createState() =>
      _TransactionBottomSheetWidgetState();
}

class _TransactionBottomSheetWidgetState
    extends State<TransactionBottomSheetWidget> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(mPaddingMedium),
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomTabBarWidget(
              tabController: _tabController,
              tabs: const [
                Tab(text: 'Expense'),
                Tab(text: 'Income'),
                Tab(text: 'Transfer'),
              ],
            )
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                // Expense Form
                ExpenseForm(),
                // Income Form
                IncomeForm(),
                // Transfer Form
                TransferForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExpenseForm extends StatelessWidget {
  const ExpenseForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Add Transfer'),
        actions: [
          IconButton(
            onPressed: () {
              // Handle close button press
            },
            icon: const Icon(Icons.close),
          ),
          const SizedBox(width: 8),
          const Text('0 THB'),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('From Wallet', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Icon(Icons.account_balance_wallet),
                SizedBox(width: 8),
                Text('Out of Spendee'),
              ],
            ),
            SizedBox(height: 16),
            Text('To Wallet', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Icon(Icons.account_balance_wallet),
                SizedBox(width: 8),
                Text('Daily'),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.calendar_today),
                SizedBox(width: 8),
                Text('Yesterday Today?'),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.edit),
                SizedBox(width: 8),
                Text('Write a note'),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.refresh),
                SizedBox(width: 8),
                Text('Recurrence Never'),
              ],
            ),
            SizedBox(height: 16),
            Text('Add an Amount'),
            // Numeric keypad here (customize as needed)
          ],
        ),
      ),
    );
  }
}


class IncomeForm extends StatelessWidget {
  const IncomeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                // Add logic for selecting income categories
              },
              icon: const Icon(Icons.category),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Income Amount'),
            ),
            // Add widgets for selecting wallet, date picker, note, and set recurrence
          ],
        ),
      ),
    );
  }
}

class TransferForm extends StatelessWidget {
  const TransferForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Add widgets for selecting source and destination wallets, amount, note, etc.
          ],
        ),
      ),
    );
  }
}
