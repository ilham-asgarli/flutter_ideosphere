part of 'sign_cubit.dart';

class SignState {
  final bool signing;
  final bool showPasswordField;

  SignState({
    this.signing = false,
    this.showPasswordField = false,
  });

  SignState copyWith({
    bool? signing,
    bool? showPasswordField,
  }) {
    return SignState(
      signing: signing ?? this.signing,
      showPasswordField: showPasswordField ?? this.showPasswordField,
    );
  }
}
