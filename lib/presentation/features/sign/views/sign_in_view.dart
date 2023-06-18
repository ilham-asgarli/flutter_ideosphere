import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../../../core/constants/app/app_localizations.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/num_extension.dart';
import '../components/data_permission_text.dart';
import '../components/sign_form.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardVisible =
        KeyboardVisibilityProvider.isKeyboardVisible(context);

    return Padding(
      padding: context.paddingNormal * 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.welcome,
                  style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                15.verticalSpace,
                if (!isKeyboardVisible)
                  Text(
                    AppLocalizations.of(context)!.signDescription,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          const SignForm(),
          20.verticalSpace,
          Align(
            alignment: Alignment.center,
            child: DataPermissionText(
              text: AppLocalizations.of(context)!.termOfUseDescription(
                  AppLocalizations.of(context)!.termOfUse),
              regex: AppLocalizations.of(context)!.termOfUse,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
