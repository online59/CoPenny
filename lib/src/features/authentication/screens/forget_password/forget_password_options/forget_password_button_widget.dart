import 'package:flutter/material.dart';
import 'package:piggy/src/constants/sizes.dart';


class ForgetPasswordButtonWidget extends StatelessWidget {
  const ForgetPasswordButtonWidget({
    super.key,
    required this.buttonIcon,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final IconData buttonIcon;
  final String title, subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(mButtonHeight),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(mButtonRadiusSmall),
            color: Colors.grey[200]),
        child: Row(
          children: [
            Icon(
              buttonIcon,
              size: 60.0,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}