import 'package:bloc/bloc.dart';

part 'sign_state.dart';

class SignCubit extends Cubit<SignState> {
  SignCubit() : super(SignState());

  void changeSigning({bool? signingIn}) {
    emit(state.copyWith(
      signingIn: signingIn ?? !state.signing,
    ));
  }

  void changePasswordFieldVisibility({bool? showPasswordField}) {
    emit(state.copyWith(
      showPasswordField: showPasswordField ?? !state.showPasswordField,
    ));
  }
}
