import 'package:centered_singlechildscrollview/centered_singlechildscrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/num_extension.dart';
import '../../../components/custom_circle_button.dart';
import '../components/sign_up_form.dart';
import '../state/cubit/sign_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CenteredSingleChildScrollView(
      children: [
        Padding(
          padding: context.paddingNormal * 1.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCircleButton(
                child: const FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.white,
                ),
                onTap: () {
                  context.read<SignCubit>().signViewModel.animateToPage(0);
                },
              ),
              20.verticalSpace,
              const SignUpForm(),
              15.verticalSpace,
            ],
          ),
        ),
      ],
    );
  }
}
