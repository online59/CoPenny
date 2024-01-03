import 'package:flutter/material.dart';
import 'package:piggy/src/common_widget/appbars/sliver_pinned_app_bar.dart';
import 'package:piggy/src/features/core/screen/dashboard/widgets/bar_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            MyBarChart()
          ],
        ),
      ),
    );
  }
}
