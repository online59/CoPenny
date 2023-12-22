import 'package:flutter/material.dart';
import 'package:piggy/features/transaction/presentation/widgets/card_header_widget.dart';
import 'package:piggy/features/transaction/presentation/widgets/card_item_widget.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../domain/models/transaction_item_model.dart';

class TransactionCardWidget extends StatelessWidget {
  const TransactionCardWidget({
    super.key,
    required this.transHeader,
    required this.transItems,
    required this.totalAmount,
  });

  final String transHeader;
  final String totalAmount;
  final List<TransItemModel> transItems;

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      //pin header to top
      pushPinnedChildren: true,

      children: [
        SliverStack(
          //make sure overlapping area handling properly
          insetOnOverlap: false,
          children: [
            //positioned child in this stack
            SliverPositioned.fill(
              child: Container(
                padding: EdgeInsets.zero,
              ),
            ),
            buildGroupItem(context),
          ],
        )
      ],
    );
  }

  Widget buildGroupItem(BuildContext context) {
    return MultiSliver(
      children: [
        //header of this transaction day
        SliverPinnedHeader(
          //container of the header
          child: CardHeaderWidget(
            header: transHeader,
            totalAmount: totalAmount,
          ),
        ),

        //list of transaction on this day
        SliverClip(
          child: MultiSliver(
            //build transaction item of this day
            children: [
              buildTransactionItem(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTransactionItem(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, index) {
          //container of the transaction items
          return GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(transItems[index].content),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            child: CardItemWidget(
                circleAvatar: const CircleAvatar(
                  child: Text('A'),
                ),
                content: transItems[index].content,
                amount: transItems[index].getFormattedAmount()),
          );
        },
        childCount: transItems.length,
      ),
    );
  }
}
