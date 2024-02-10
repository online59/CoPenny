import 'package:flutter/material.dart';
import 'package:piggy/src/common_widget/tabs/custom_tab_bar_widget.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/features/core/screen/add_transaction/form/expense_form_widget.dart';
import 'package:piggy/src/features/core/screen/add_transaction/form/income_form_widget.dart';
import 'package:piggy/src/features/core/screen/add_transaction/form/transfer_form_widget.dart';

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
      padding: const EdgeInsets.all(mPaddingSmall),
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
              )),
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
