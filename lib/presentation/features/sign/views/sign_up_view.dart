import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../components/custom_circle_button.dart';
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
        ],
      ),
    );
  }
}
