import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/num_extension.dart';
import '../../../../utils/logic/constants/locale/locale_keys.g.dart';
import '../../../../utils/ui/constants/colors/app_colors.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_text_field.dart';
import '../../../widgets/fractionally_sized_circular_progress_indicator.dart';
import '../state/cubit/sign_cubit.dart';

class SignForm extends StatelessWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            onChanged: (p0) {
              if (readSignCubit.state.showPasswordField) {
                readSignCubit.changePasswordFieldVisibility(
                  showPasswordField: false,
                );
              }
            },
          ),
          if (watchSignState.showPasswordField)
            Column(
              children: [
                5.verticalSpace,
                CustomTextField(
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
              await readSignCubit.signViewModel.onTap(readSignCubit);
            },
          ),
        ],
      ),
    );
  }
}
