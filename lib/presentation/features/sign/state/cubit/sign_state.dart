part of 'sign_cubit.dart';

class SignState {
  final bool signing;
  final bool showPasswordField;

  SignState({
    this.signing = false,
    this.showPasswordField = false,
  });

  SignState copyWith({
    bool? signingIn,
    bool? showPasswordField,
  }) {
    return SignState(
      signing: signingIn ?? this.signing,
      showPasswordField: showPasswordField ?? this.showPasswordField,
    );
  }
}
