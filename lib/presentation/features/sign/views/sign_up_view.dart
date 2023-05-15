import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/num_extension.dart';
import '../../../../utils/ui/constants/colors/app_colors.dart';
import '../../../components/custom_circle_button.dart';
import '../../../components/custom_text_field.dart';
import '../state/cubit/sign_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignState watchSignState = context.watch<SignCubit>().state;
    SignCubit readSignCubit = context.read<SignCubit>();

    return Padding(
      padding: context.paddingNormal * 1.5,
      child: Column(
        children: [
          CustomCircleButton(
            child: const FaIcon(FontAwesomeIcons.arrowLeft),
            onTap: () {
              readSignCubit.signViewModel.animateToPage(0);
            },
          ),
          15.verticalSpace,
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  fillColor: Colors.white,
                  hintText: "İsim",
                  hintTextColor: Colors.grey,
                  textColor: AppColors.mainColor,
                  keyboardType: TextInputType.name,
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
                ),
              ),
            ],
          ),
          10.verticalSpace,
          CustomTextField(
            fillColor: Colors.white,
            hintText: "Telefon numarası",
            hintTextColor: Colors.grey,
            textColor: AppColors.mainColor,
            keyboardType: TextInputType.phone,
            maxLength: 20,
          ),
          10.verticalSpace,
          CustomTextField(
            fillColor: Colors.white,
            hintText: "Şifre",
            hintTextColor: Colors.grey,
            textColor: AppColors.mainColor,
            obscureText: true,
          ),
          10.verticalSpace,
          CustomTextField(
            fillColor: Colors.white,
            hintText: "Şifre",
            hintTextColor: Colors.grey,
            textColor: AppColors.mainColor,
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
