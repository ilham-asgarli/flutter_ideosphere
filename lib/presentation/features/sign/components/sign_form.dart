import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/num_extension.dart';
import '../../../../core/router/core/router_service.dart';
import '../../../../utils/logic/constants/locale/locale_keys.g.dart';
import '../../../../utils/logic/constants/router/router_constants.dart';
import '../../../../utils/ui/constants/colors/app_colors.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_text_field.dart';
import '../../../widgets/fractionally_sized_circular_progress_indicator.dart';
import '../state/cubit/sign_cubit.dart';

class SignForm extends StatelessWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusNode passwordFocusNode = FocusNode();

    SignState watchSignState = context.watch<SignCubit>().state;
    SignCubit readSignCubit = context.read<SignCubit>();

    return Form(
      child: Column(
        children: [
          CustomTextField(
            fillColor: Colors.white,
            hintText: LocaleKeys.email.tr(),
            hintTextColor: Colors.grey,
            textColor: AppColors.mainColor,
            keyboardType: TextInputType.emailAddress,
          ),
          if (watchSignState.showPasswordField)
            Column(
              children: [
                5.verticalSpace,
                CustomTextField(
                  focusNode: passwordFocusNode,
                  fillColor: Colors.white,
                  hintText: LocaleKeys.password.tr(),
                  hintTextColor: Colors.grey,
                  textColor: AppColors.mainColor,
                  obscureText: true,
                ),
              ],
            ),
          10.verticalSpace,
          CustomButton(
            height: 50,
            text: watchSignState.showPasswordField
                ? LocaleKeys.signIn.tr()
                : LocaleKeys.continue_.tr(),
            child: watchSignState.signing
                ? const FractionallySizedCircularProgressIndicator(
                    factor: 0.5,
                  )
                : null,
            onTap: () async {
              readSignCubit.changeSigning();

              if (!readSignCubit.state.showPasswordField) {
                // TODO check email
                await Future.delayed(const Duration(seconds: 2));

                if (false) {
                  // true : email exists
                  readSignCubit.changePasswordFieldVisibility();
                } else {
                  readSignCubit.signViewModel.scrollController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                  );
                }
              } else {
                RouterService.instance.pushNamedAndRemoveUntil(
                  path: RouterConstants.main,
                );
              }
              readSignCubit.changeSigning();
            },
          ),
        ],
      ),
    );
  }
}
