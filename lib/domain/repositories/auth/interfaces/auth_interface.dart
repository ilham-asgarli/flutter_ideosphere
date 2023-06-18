import '../../../../data/models/sign.dart';
import '../../../models/sign_in_model.dart';
import '../../../models/sign_up_model.dart';

abstract class AuthInterface {
  Future<bool> checkEmail(String data);
  Future<Sign> signIn(SignInModel data);
  Future<Sign> signUp(SignUpModel data);
}
