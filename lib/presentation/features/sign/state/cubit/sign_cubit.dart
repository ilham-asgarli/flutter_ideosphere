import 'package:bloc/bloc.dart';

import '../../view-models/sign_view_model.dart';

part 'sign_state.dart';

class SignCubit extends Cubit<SignState> {
  late final SignViewModel signViewModel;

  SignCubit() : super(SignState()) {
    signViewModel = SignViewModel(this);
  }

  void changeSigning({bool? signing}) {
    emit(state.copyWith(
      signing: signing ?? !state.signing,
    ));
  }

  void changePasswordFieldVisibility({bool? showPasswordField}) {
    emit(state.copyWith(
      showPasswordField: showPasswordField ?? !state.showPasswordField,
    ));
  }
}
