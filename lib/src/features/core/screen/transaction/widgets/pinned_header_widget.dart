import 'package:flutter/material.dart';

class PinnedHeaderWidget extends StatelessWidget {
  const PinnedHeaderWidget(
      {super.key, required this.header, required this.totalAmount});

  final String header;
  final String totalAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      color: Theme.of(context).colorScheme.inversePrimary,
      child: Row(
        children: [
          _buildHeaderItem(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 24),
              text: header),
          _buildHeaderItem(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 24),
              text: totalAmount),
        ],
      ),
    );
  }

  Expanded _buildHeaderItem({
    required Alignment alignment,
    required EdgeInsets padding,
    required String text,
  }) {
    return Expanded(
      child: Align(
          alignment: alignment,
          child: Padding(padding: padding, child: Text(text))),
    );
  }
}
