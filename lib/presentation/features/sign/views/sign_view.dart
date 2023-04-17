import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ideosphere/presentation/components/custom_button.dart';
import 'package:rive/rive.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/num_extension.dart';
import '../../../../utils/logic/constants/locale/locale_keys.g.dart';
import '../../../../utils/ui/constants/colors/app_colors.dart';
import '../../../components/custom_text_field.dart';

class SignView extends StatelessWidget {
  const SignView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const RiveAnimation.asset(
              "assets/rive/shapes.riv",
              fit: BoxFit.cover,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20,
                sigmaY: 10,
              ),
              child: const SizedBox(),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: Padding(
                  padding: context.paddingNormal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: 260,
                          child: Column(
                            children: [
                              Text(
                                "Hoş Geldin!",
                                style: TextStyle(
                                  fontSize: 60,
                                ),
                              ),
                              15.verticalSpace,
                              Text(
                                "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          CustomTextField(
                            fillColor: Colors.white,
                            hintText: "Email",
                            hintTextColor: Colors.grey,
                            textColor: AppColors.mainColor,
                          ),
                          10.verticalSpace,
                          CustomButton(
                            height: 50,
                            color: Colors.white,
                            text: LocaleKeys.continue_.tr(),
                            textColor: AppColors.mainColor,
                            onTap: () {
                              FocusScope.of(context).unfocus();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
