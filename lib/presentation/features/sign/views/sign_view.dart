import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/num_extension.dart';
import '../../../../utils/logic/constants/locale/locale_keys.g.dart';
import '../components/data_permission_text.dart';
import '../components/sign_form.dart';

class SignView extends StatelessWidget {
  const SignView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
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
                                LocaleKeys.welcome.tr(),
                                style: const TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              15.verticalSpace,
                              if (context.bottomInset == 0)
                                Text(
                                  LocaleKeys.signDescription.tr(),
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
                            text: LocaleKeys.termOfUseDescription.tr(),
                            regex: LocaleKeys.termOfUse.tr(),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
