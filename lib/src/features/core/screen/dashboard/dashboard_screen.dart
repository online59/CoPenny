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
            children: [
              Text(
                mAppName,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
