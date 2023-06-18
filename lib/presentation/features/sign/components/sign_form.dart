import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app/app_localizations.dart';
import '../../../../core/extensions/num_extension.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../utils/ui/constants/colors/app_colors.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_text_field.dart';
import '../../../widgets/fractionally_sized_circular_progress_indicator.dart';
import '../state/cubit/sign_cubit.dart';

class SignForm extends StatelessWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignCubit>().signViewModel.signInFormKey,
      child: Column(
        children: [
          CustomTextField(
            fillColor: Colors.white,
            hintText: AppLocalizations.of(context)!.email,
            hintTextColor: Colors.grey,
            textColor: AppColors.mainColor,
            keyboardType: TextInputType.emailAddress,
            onChanged: (p0) {
              if (context.read<SignCubit>().state.showPasswordField) {
                context.read<SignCubit>().changePasswordFieldVisibility(
                      showPasswordField: false,
                    );
              }
            },
            onSaved: (newValue) {
              if (newValue.isNotNull) {
                context.read<SignCubit>().signViewModel.email = newValue!;
              }
            },
            validator: (value) {
              if (value.isNull || value!.isEmpty) {
                return 'Required';
              } else if (!value.isEmail) {
                return 'Bad formatted';
              }
              return null;
            },
          ),
          if (context.watch<SignCubit>().state.showPasswordField)
            Column(
              children: [
                5.verticalSpace,
                CustomTextField(
                  fillColor: Colors.white,
                  hintText: AppLocalizations.of(context)!.password,
                  hintTextColor: Colors.grey,
                  textColor: AppColors.mainColor,
                  obscureText: true,
                  onSaved: (newValue) {
                    if (newValue.isNotNull) {
                      context.read<SignCubit>().signViewModel.password =
                          newValue!;
                    }
                  },
                  validator: (value) {
                    if (value.isNull || value!.isEmpty) {
                      return 'Required';
                    } else if (value.length < 6) {
                      return 'Weak';
                    }
                    return null;
                  },
                ),
              ],
            ),
          10.verticalSpace,
          CustomButton(
            height: 50,
            text: context.watch<SignCubit>().state.showPasswordField
                ? AppLocalizations.of(context)!.signIn
                : AppLocalizations.of(context)!.continue_,
            child: context.watch<SignCubit>().state.signing
                ? const FractionallySizedCircularProgressIndicator(
                    factor: 0.5,
                  )
                : null,
            onTap: () async {
              await context.read<SignCubit>().signViewModel.onSignIn(context);
            },
          ),
        ],
      ),
    );
  }
}
