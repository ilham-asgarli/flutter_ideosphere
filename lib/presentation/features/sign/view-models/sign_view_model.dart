import 'package:flutter/material.dart';

import '../../../../../core/router/core/router_service.dart';
import '../../../../../utils/logic/constants/router/router_constants.dart';
import '../../../../core/cache/shared_preferences_manager.dart';
import '../../../../data/models/sign.dart';
import '../../../../domain/models/sign_in_model.dart';
import '../../../../domain/models/sign_up_model.dart';
import '../../../../domain/repositories/auth/implementations/auth_repository.dart';
import '../../../../utils/logic/constants/cache/shared_preferences_constants.dart';
import '../state/cubit/sign_cubit.dart';

class SignViewModel {
  final SignCubit signCubit;
  SignViewModel(this.signCubit);

  final AuthRepository authRepository = AuthRepository();

  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final FocusNode emailFocusNode = FocusNode();
  final PageController scrollController = PageController();
  final TextEditingController newPasswordController = TextEditingController();

  late String email;
  late String password;
  String? newPassword;
  late String confirmPassword;
  late int genderId;
  String? phoneNumber;
  String? firstname;
  String? lastname;
  String? biography;

  Future<void> animateToPage(int page) async {
    return scrollController.animateToPage(
      page,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  Future<void> onSignIn(BuildContext context) async {
    if (signCubit.state.signing) {
      return;
    }

    signCubit.changeSigning(signing: true);

    if (!signCubit.state.showPasswordField) {
      validateFormAndSave(signInFormKey);

      try {
        bool exists = await authRepository.checkEmail(email);

        if (exists) {
          signCubit.changePasswordFieldVisibility(showPasswordField: true);
        } else {
          signCubit.signViewModel.animateToPage(1);
        }
      } catch (e) {}
    } else {
      try {
        validateFormAndSave(signInFormKey);

        FocusScope.of(context).unfocus();

        Sign signModel = await authRepository.signIn(SignInModel(
          email: email,
          password: password,
        ));

        await SharedPreferencesManager.instance.preferences?.setString(
            SharedPreferencesConstants.accessToken, signModel.token);

        if (context.mounted) {
          RouterService.instance.pushNamedAndRemoveUntil(
            context: context,
            path: RouterConstants.main,
          );
        }
      } catch (e) {}
    }

    signCubit.changeSigning(signing: false);
  }

  Future<void> onSignUp(BuildContext context) async {
    if (signCubit.state.signing) {
      return;
    }

    signCubit.changeSigning(signing: true);

    try {
      validateFormAndSave(signUpFormKey);

      FocusScope.of(context).unfocus();

      Sign signModel = await authRepository.signUp(SignUpModel(
        email: email,
        password: confirmPassword,
        phoneNumber: phoneNumber,
        customerModel: CustomerModel(
          genderId: genderId,
          firstname: firstname,
          lastname: lastname,
          biography: biography,
        ),
      ));

      await SharedPreferencesManager.instance.preferences
          ?.setString(SharedPreferencesConstants.accessToken, signModel.token);

      if (context.mounted) {
        RouterService.instance.pushNamedAndRemoveUntil(
          context: context,
          path: RouterConstants.main,
        );
      }
    } catch (e) {}

    signCubit.changeSigning(signing: false);
  }

  void validateFormAndSave(GlobalKey<FormState> formKey) {
    if (!formKey.currentState!.validate()) {
      signCubit.changeSigning(signing: false);
      throw Error();
    }
    formKey.currentState!.save();
  }
}
