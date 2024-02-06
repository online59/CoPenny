import 'package:flutter/material.dart';
import 'package:piggy/src/constants/sizes.dart';

class PinnedHeaderWidget extends StatelessWidget {
  const PinnedHeaderWidget(
      {super.key, required this.header, required this.totalAmount});

  final String header;
  final String totalAmount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.04,
        color: Theme.of(context).colorScheme.background,
        child: Row(
          children: [
            _buildHeaderItem(context,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 30.0),
                text: header),
            _buildHeaderItem(context,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 30.0),
                text: totalAmount),
          ],
        ),
      ),
    );
  }

  Expanded _buildHeaderItem(
    BuildContext context, {
    required Alignment alignment,
    required EdgeInsets padding,
    required String text,
  }) {
    return Expanded(
      child: Align(
        alignment: alignment,
        child: Padding(
          padding: padding,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.grey,
              fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
