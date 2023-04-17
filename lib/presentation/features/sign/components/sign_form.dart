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
    return Form(
      child: Column(
        children: [
          CustomTextField(
            fillColor: Colors.white,
            hintText: "Email",
            hintTextColor: Colors.grey,
            textColor: AppColors.mainColor,
            keyboardType: TextInputType.emailAddress,
          ),
          10.verticalSpace,
          CustomButton(
            height: 50,
            color: Colors.white,
            text: LocaleKeys.continue_.tr(),
            textColor: AppColors.mainColor,
            child: context.watch<SignCubit>().state.signingIn
                ? FractionallySizedCircularProgressIndicator(
                    factor: 0.5,
                    color: AppColors.mainColor,
                  )
                : null,
            onTap: () {
              FocusScope.of(context).unfocus();
              context.read<SignCubit>().changeSigning();

              Future.delayed(const Duration(seconds: 2))
                  .then((value) => context.read<SignCubit>().changeSigning());
            },
          ),
        ],
      ),
    );
  }
}
