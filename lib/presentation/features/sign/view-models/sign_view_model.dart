import 'package:flutter/material.dart';

import '../../../../../core/router/core/router_service.dart';
import '../../../../../utils/logic/constants/router/router_constants.dart';
import '../../../../core/cache/shared_preferences_manager.dart';
import '../../../../utils/logic/constants/cache/shared_preferences_constants.dart';
import '../state/cubit/sign_cubit.dart';

class SignViewModel {
  final FocusNode emailFocusNode = FocusNode();
  final PageController scrollController = PageController();

  late final SignState watchSignState;
  late final SignCubit readSignCubit;

  Future<void> animateToPage(int page) async {
    return scrollController.animateToPage(
      page,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  Future<void> onSignIn(BuildContext context, SignCubit readSignCubit) async {
    readSignCubit.changeSigning(signing: true);

    if (!readSignCubit.state.showPasswordField) {
      // TODO check email
      await Future.delayed(const Duration(seconds: 2));

      if (false) {
        // true : email exists
        readSignCubit.changePasswordFieldVisibility(showPasswordField: true);
      } else {
        readSignCubit.signViewModel.animateToPage(1);
      }
    } else {
      FocusScope.of(context).unfocus();

      // TODO check password
      await Future.delayed(const Duration(seconds: 2));
      await SharedPreferencesManager.instance.preferences
          ?.setBool(SharedPreferencesConstants.isSignedIn, true);

      RouterService.instance.pushNamedAndRemoveUntil(
        path: RouterConstants.main,
      );
    }

    readSignCubit.changeSigning(signing: false);
  }

  Future<void> onSignUp(BuildContext context, SignCubit readSignCubit) async {
    readSignCubit.changeSigning(signing: true);

    FocusScope.of(context).unfocus();

    // TODO sign up
    await Future.delayed(const Duration(seconds: 2));
    await SharedPreferencesManager.instance.preferences
        ?.setBool(SharedPreferencesConstants.isSignedIn, true);

    RouterService.instance.pushNamedAndRemoveUntil(
      path: RouterConstants.main,
    );

    readSignCubit.changeSigning(signing: false);
  }
}
