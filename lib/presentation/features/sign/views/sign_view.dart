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
    SignCubit readSignCubit = context.read<SignCubit>();

    return WillPopScope(
      onWillPop: () async {
        if (readSignCubit.signViewModel.scrollController.page == 1) {
          readSignCubit.signViewModel.animateToPage(0);
          return false;
        }
        return true;
      },
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: GestureDetector(
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
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 20,
                      sigmaY: 10,
                    ),
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: PageView(
                        controller:
                            readSignCubit.signViewModel.scrollController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const [
                          SignInView(),
                          SignUpView(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
