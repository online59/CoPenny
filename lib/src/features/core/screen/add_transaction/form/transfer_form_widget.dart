import 'package:flutter/material.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/constants/text_strings.dart';
import 'package:piggy/src/features/core/screen/add_transaction/utils/thousands_formattetr.dart';
import 'package:piggy/src/features/core/screen/add_transaction/widgets/date_picker_widget.dart';

class TransferForm extends StatefulWidget {
  const TransferForm({super.key});

  @override
  State<TransferForm> createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(mPaddingSmall),
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: mVSpacingSmall,
            ),
            const Text(
              mAddNewTransfer,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: mAddTransactionTitleFontSize,
                color: Colors.black,
              ),
            ),
            Text(
              mAddTransferSubtitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: mPaddingMedium,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const CustomDatePickerWidget(),
                const SizedBox(width: mHSpacingSmall),
                Expanded(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
