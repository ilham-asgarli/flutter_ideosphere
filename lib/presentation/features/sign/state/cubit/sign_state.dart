part of 'sign_cubit.dart';

class SignState {
  final bool signingIn;

  SignState({
    this.signingIn = false,
  });

  SignState copyWith({
    bool? signingIn,
  }) {
    return SignState(
      signingIn: signingIn ?? this.signingIn,
    );
  }
}
