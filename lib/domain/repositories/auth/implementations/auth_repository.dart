import '../../../../core/base/models/base_success.dart';
import '../../../../data/data-sources/auth/implementations/auth_data_source.dart';
import '../../../../data/models/sign.dart';
import '../../../models/sign_in_model.dart';
import '../../../models/sign_up_model.dart';
import '../interfaces/auth_interface.dart';

class AuthRepository extends AuthInterface {
  final AuthDataSource authDataSource = AuthDataSource();

  @override
  Future<bool> checkEmail(String data) async {
    final response = await authDataSource.checkEmail(data);

    if (response is BaseSuccess) {
      return true;
    }

    return false;
  }

  @override
  Future<Sign> signIn(SignInModel data) async {
    final response = await authDataSource.signIn(data.toJson());

    if (response is BaseSuccess<Sign>) {
      return response.data;
    }

    throw Error();
  }

  @override
  Future<Sign> signUp(SignUpModel data) async {
    final response = await authDataSource.signUp(data.toJson());

    if (response is BaseSuccess<Sign>) {
      return response.data;
    }

    throw Error();
  }
}
