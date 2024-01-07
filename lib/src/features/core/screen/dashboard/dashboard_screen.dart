import 'package:flutter/material.dart';
import 'package:piggy/src/common_widget/appbars/sliver_pinned_app_bar.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/features/core/screen/dashboard/widgets/wallet_balance_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                elevation: 4,
                child: WalletBalanceChart(
                  barTitle: "My Wallet",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
