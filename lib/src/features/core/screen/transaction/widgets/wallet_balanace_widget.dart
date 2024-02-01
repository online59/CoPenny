import 'package:flutter/material.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/constants/text_strings.dart';

class WalletBalanceWidget extends StatelessWidget {
  const WalletBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(mDefaultSize),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildBalanceItem(
            context,
            title: mIncome,
            amount: mIncomeDummy,
          ),
          _buildBalanceItem(
            context,
            title: mCurrentBalance.toUpperCase(),
            amount: mBalanceDummy,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          _buildBalanceItem(
            context,
            title: mExpense,
            amount: mExpenseDummy,
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceItem(
      BuildContext context, {
        required String title,
        required String amount,
        TextStyle? style,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: mVSpacingSmall,
        ),
        Text(
          '$mThb $amount',
          style: style ?? Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
