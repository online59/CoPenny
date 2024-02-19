import 'package:flutter/material.dart';
import 'package:piggy/src/common_widget/containers/gradient_container_widget.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/constants/text_strings.dart';
import 'package:piggy/src/features/core/screen/add_transaction/data/category_data.dart';
import 'package:piggy/src/features/core/screen/add_transaction/models/category_model.dart';
import 'package:piggy/src/features/core/screen/add_transaction/widgets/date_picker_widget.dart';
import 'package:piggy/src/features/core/screen/add_transaction/widgets/selectable_widget.dart';
import 'package:piggy/src/features/core/screen/add_transaction/widgets/transaction_input_field_widget.dart';

class IncomeForm extends StatefulWidget {
  const IncomeForm({super.key});

  @override
  State<IncomeForm> createState() => _IncomeFormState();
}

class _IncomeFormState extends State<IncomeForm> {
  CategoryModel? selectedCategory;

  void toggleCategorySelection(CategoryModel category) {
    setState(() {
      if (selectedCategory == category) {
        selectedCategory = null;
      } else {
        selectedCategory = category;
      }
    });
  }

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
            bottomSection(),
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
                      borderRadius: BorderRadius.circular(mContainerSmallRadius),
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
          mAddNewIncome,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: mAddTransactionTitleFontSize,
            color: Colors.black,
          ),
        ),
        Text(
          mAddIncomeSubtitle,
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

  bottomSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Text(
          mSelectCategory,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: mAddTransactionTitleFontSize,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: mVSpacingSmall),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: incomeCategories.map((category) {
            final isSelected = selectedCategory == category;
            return SelectableItem(
              category: category,
              isSelected: isSelected,
              onTap: () => toggleCategorySelection(category),
            );
          }).toList(),
        )
      ],
    );
  }
}
