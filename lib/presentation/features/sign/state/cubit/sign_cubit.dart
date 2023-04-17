import 'package:bloc/bloc.dart';

part 'sign_state.dart';

class SignCubit extends Cubit<SignState> {
  SignCubit() : super(SignState());

  void changeSigning({bool? signingIn}) {
    emit(state.copyWith(signingIn: signingIn ?? !state.signingIn));
  }
}
