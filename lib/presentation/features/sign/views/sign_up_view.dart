import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/context_extension.dart';
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
          BackButton(
            onPressed: () {
              readSignCubit.signViewModel.scrollController.animateToPage(
                0,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn,
              );
            },
          ),
        ],
      ),
    );
  }
}
