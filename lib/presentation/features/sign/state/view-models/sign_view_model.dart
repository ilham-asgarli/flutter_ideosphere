import 'package:flutter/material.dart';

import '../../../../../core/router/core/router_service.dart';
import '../../../../../utils/logic/constants/router/router_constants.dart';
import '../cubit/sign_cubit.dart';

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

  Future<void> onTap(BuildContext context, SignCubit readSignCubit) async {
    readSignCubit.changeSigning(signing: true);

    if (!readSignCubit.state.showPasswordField) {
      // TODO check email
      await Future.delayed(const Duration(seconds: 2));

      if (true) {
        // true : email exists
        readSignCubit.changePasswordFieldVisibility(showPasswordField: true);
      } else {
        readSignCubit.signViewModel.animateToPage(1);
      }
    } else {
      FocusScope.of(context).unfocus();

      // TODO password email
      await Future.delayed(const Duration(seconds: 2));

      RouterService.instance.pushNamedAndRemoveUntil(
        path: RouterConstants.main,
      );
    }
    readSignCubit.changeSigning(signing: false);
  }
}
