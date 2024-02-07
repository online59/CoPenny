import 'package:flutter/material.dart';

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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Theme.of(context).colorScheme.primary, // Primary color
                borderRadius: BorderRadius.circular(10.0),
              ),
              labelColor: Theme.of(context).colorScheme.onPrimary, // On primary color
              tabs: const [
                Tab(text: 'Expense'),
                Tab(text: 'Income'),
                Tab(text: 'Transfer'),
              ],
            ),
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
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                // Add logic for selecting expense categories
              },
              icon: const Icon(Icons.category),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Expense Amount'),
            ),
            // Add widgets for selecting wallet, date picker, note, and set recurrence
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
