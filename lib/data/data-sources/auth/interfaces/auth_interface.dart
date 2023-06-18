import '../../../../core/base/models/base_response.dart';
import '../../../models/sign.dart';

abstract class AuthInterface {
  Future<BaseResponse> checkEmail(data);
  Future<BaseResponse<Sign>> signIn(data);
  Future<BaseResponse<Sign>> signUp(data);
}
