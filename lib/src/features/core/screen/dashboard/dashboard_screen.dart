import 'package:flutter/material.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/constants/text_strings.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //dummy data
    var items = List<String>.generate(30, (i) => 'Item $i');

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(mDefaultSize),
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(mCurrentBalance.toUpperCase(),
                      style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(
                    height: mVSpacingSmall,
                  ),
                  Text.rich(
                    TextSpan(
                      text: "$mThb ",
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                            text: mBalanceDummy,
                            style: Theme.of(context).textTheme.headlineLarge)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: mVSpacingSmall,
                  ),
                  Text.rich(
                    TextSpan(
                      text: "$mMonthDummy ",
                      style: Theme.of(context).textTheme.bodySmall,
                      children: [
                        TextSpan(
                          text: mYearDummy,
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text.rich(TextSpan(text: mIncome, children: [
                        TextSpan(text: "\n $mThb $mIncomeDummy")
                      ])),
                      Text.rich(TextSpan(text: mExpense, children: [
                        TextSpan(text: "\n $mThb $mExpenseDummy")
                      ])),
                    ],
                  ),
                ],
              ),
            ),
            Container(
            )
          ],
        ),
      ),
    );
  }
}
