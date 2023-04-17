import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import '../state/cubit/sign_cubit.dart';
import 'sign_in_view.dart';
import 'sign_up_view.dart';

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
                  child: PageView(
                    controller: context
                        .read<SignCubit>()
                        .signViewModel
                        .scrollController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SignInView(),
                      SignUpView(),
                    ],
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
