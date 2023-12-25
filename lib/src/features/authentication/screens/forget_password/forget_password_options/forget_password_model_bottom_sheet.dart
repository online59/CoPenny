import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/constants/text_strings.dart';
import 'package:piggy/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';
import 'package:piggy/src/features/authentication/screens/forget_password/forget_password_options/forget_password_button_widget.dart';

class ForgetPasswordScreen {

  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(mDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mForgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              mForgetPasswordSubTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: mVSpacingLarge,
            ),
            ForgetPasswordButtonWidget(
              buttonIcon: Icons.mail_outline_rounded,
              title: mEmail,
              subTitle: mResetViaEmail,
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgetPasswordMailScreen());
              },
            ),
            const SizedBox(
              height: mVSpacingMedium,
            ),
            ForgetPasswordButtonWidget(
              buttonIcon: Icons.mobile_friendly_rounded,
              title: mPhoneNumber,
              subTitle: mResetViaPhone,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

}