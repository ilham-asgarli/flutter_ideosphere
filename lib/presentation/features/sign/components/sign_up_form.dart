import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/extensions/num_extension.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../utils/ui/constants/colors/app_colors.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_phone_field.dart';
import '../../../components/custom_text_field.dart';
import '../../../widgets/fractionally_sized_circular_progress_indicator.dart';
import '../state/cubit/sign_cubit.dart';
import 'choose_gender.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignCubit>().signViewModel.signUpFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  fillColor: Colors.white,
                  hintText: "İsim",
                  hintTextColor: Colors.grey,
                  textColor: AppColors.mainColor,
                  keyboardType: TextInputType.name,
                  onSaved: (newValue) {
                    if (newValue.isNotNull && newValue!.isNotEmpty) {
                      context.read<SignCubit>().signViewModel.firstname =
                          newValue;
                    }
                  },
                  validator: (value) {
                    return null;
                  },
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: CustomTextField(
                  fillColor: Colors.white,
                  hintText: "Soyisim",
                  hintTextColor: Colors.grey,
                  textColor: AppColors.mainColor,
                  keyboardType: TextInputType.name,
                  onSaved: (newValue) {
                    if (newValue.isNotNull && newValue!.isNotEmpty) {
                      context.read<SignCubit>().signViewModel.lastname =
                          newValue;
                    }
                  },
                  validator: (value) {
                    return null;
                  },
                ),
              ),
            ],
          ),
          10.verticalSpace,
          ChooseGender(
            onChange: (int gender) {
              context.read<SignCubit>().signViewModel.genderId = gender;
            },
          ),
          10.verticalSpace,
          const CustomPhoneField(),
          10.verticalSpace,
          CustomTextField(
            controller:
                context.read<SignCubit>().signViewModel.newPasswordController,
            fillColor: Colors.white,
            hintText: "Şifre",
            hintTextColor: Colors.grey,
            textColor: AppColors.mainColor,
            obscureText: true,
            onSaved: (newValue) {
              if (newValue.isNotNull) {
                context.read<SignCubit>().signViewModel.newPassword = newValue!;
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
          10.verticalSpace,
          CustomTextField(
            fillColor: Colors.white,
            hintText: "Şifre",
            hintTextColor: Colors.grey,
            textColor: AppColors.mainColor,
            obscureText: true,
            onSaved: (newValue) {
              if (newValue.isNotNull) {
                context.read<SignCubit>().signViewModel.confirmPassword =
                    newValue!;
              }
            },
            validator: (value) {
              if (value !=
                  context
                      .read<SignCubit>()
                      .signViewModel
                      .newPasswordController
                      .text) {
                return "Not same";
              }
              return null;
            },
          ),
          10.verticalSpace,
          CustomButton(
            height: 50,
            text: AppLocalizations.of(context)!.signUp,
            child: context.watch<SignCubit>().state.signing
                ? const FractionallySizedCircularProgressIndicator(
                    factor: 0.5,
                  )
                : null,
            onTap: () {
              context.read<SignCubit>().signViewModel.onSignUp(context);
            },
          ),
        ],
      ),
    );
  }
}
