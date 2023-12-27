import 'package:flutter/material.dart';
import 'package:piggy/src/constants/text_strings.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.grey[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(mCurrentBalance.toUpperCase(),
                  style: Theme.of(context).textTheme.bodySmall),
              Text(mBalanceDummy,
                  style: Theme.of(context).textTheme.bodySmall),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
