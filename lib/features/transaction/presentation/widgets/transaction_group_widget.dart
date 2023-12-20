import 'package:flutter/material.dart';
import 'package:piggy/features/transaction/data/models/group_transaction_model.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../data/models/transaction_item_model.dart';

class TransactionGroupWidget extends StatelessWidget{
  const TransactionGroupWidget(
      {super.key,
      required this.transactionHeader,
      required this.transactionList});

  final DateTime transactionHeader;
  final List<TransactionItemModel> transactionList;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: MultiSliver(
        //pin header to top
        pushPinnedChildren: true,

        children: [
          SliverStack(
            //make sure overlapping area handling properly
            insetOnOverlap: true,
            children: [
              //positioned child in this stack
              SliverPositioned.fill(
                child: Container(),
              ),
              buildGroupItem(),
            ],
          )
        ],
      ),
    );
  }

  Widget buildGroupItem() {
    return MultiSliver(children: [
      //header of this transaction day
      SliverPinnedHeader(
        child: Container(
          color: Colors.grey[400],
          child: Text(transactionHeader.toString()),
        ),
      ),

      //list of transaction on this day
      SliverClip(
        child: MultiSliver(
          //build transaction item of this day
          children: [
            buildTransactionItem(),
          ],
        ),
      ),
    ]);
  }

  Widget buildTransactionItem() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, index) {
          return Container(
            color: Colors.grey[100],
            child: Text(transactionList[index].content),
          );
        },
        childCount: transactionList.length,
      ),
    );
  }
}
