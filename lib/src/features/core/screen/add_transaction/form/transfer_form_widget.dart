import 'package:flutter/material.dart';
import 'package:piggy/src/common_widget/containers/gradient_container_widget.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/constants/text_strings.dart';
import 'package:piggy/src/features/core/screen/add_transaction/utils/thousands_formattetr.dart';
import 'package:piggy/src/features/core/screen/add_transaction/widgets/date_picker_widget.dart';
import 'package:piggy/src/features/core/screen/add_transaction/widgets/transaction_input_field_widget.dart';

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
            const SizedBox(height: mVSpacingSmall),
            topSection(),
            const SizedBox(height: mPaddingMedium),
            middleSection(),
            const SizedBox(height: mPaddingMedium),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          mTransferFromAccount,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: mVSpacingSmall,),
                        Expanded(
                          child: GradientContainer(
                            onTap: () {},
                            beginColor: Colors.white,
                            endColor: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: const Offset(0, 1),
                              ),
                            ],
                            borderRadius:
                            BorderRadius.circular(mContainerMediumRadius),
                            child: const Center(
                              child: Text(
                                mAccount,
                                style: TextStyle(
                                    fontSize: mButtonFontSize,
                                    color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: mHSpacingSmall),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          mTransferToAccount,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: mVSpacingSmall,),
                        Expanded(
                          child: GradientContainer(
                            onTap: () {},
                            beginColor: Colors.white,
                            endColor: Colors.white,
                            borderRadius:
                            BorderRadius.circular(mContainerMediumRadius),
                            child: const Center(
                              child: Text(
                                mAccount,
                                style: TextStyle(
                                    fontSize: mButtonFontSize,
                                    color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: mPaddingMedium),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: GradientContainer(
                      onTap: () {},
                      height: 56.0,
                      borderRadius:
                          BorderRadius.circular(mContainerSmallRadius),
                      child: Center(
                        child: Text(
                          mAdd,
                          style: TextStyle(
                              fontSize: mButtonFontSize,
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  topSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }

  middleSection() {
    return const Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomDatePickerWidget(),
            SizedBox(width: mHSpacingSmall),
            TransactionInputFieldWidget(),
          ],
        ),
      ],
    );
  }
}
