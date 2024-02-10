import 'package:flutter/material.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/features/core/screen/add_transaction/utils/thousands_formattetr.dart';

class TransactionInputFieldWidget extends StatelessWidget {
  const TransactionInputFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: mPaddingSmall, vertical: mPaddingMedium),
        height: mAddTransactionAmountInputFieldHeight,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.all(
              Radius.circular(mContainerMediumRadius)),
        ),
        child: Expanded(
          child: TextField(
            maxLines: 1,
            textAlign: TextAlign.right,
            keyboardType: TextInputType.number,
            inputFormatters: [
              ThousandsFormatter(),
            ],
            style: const TextStyle(
              fontSize: mAddTransactionAmountFontSize,
              height: 1.8,
            ),
            decoration: const InputDecoration(
              prefix: Text('฿ '),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: '0',
              hintStyle: TextStyle(
                fontSize: mAddTransactionAmountFontSize,
                color: Colors.grey,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
        ),
      ),
    );
  }
}