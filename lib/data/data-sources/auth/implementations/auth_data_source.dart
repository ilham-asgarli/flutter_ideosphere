import '../../../../core/base/models/base_response.dart';
import '../../../../core/constants/enums/http_request_enum.dart';
import '../../../../core/network/core/core_http.dart';
import '../../../../utils/logic/constants/api/api_url_constants.dart';
import '../../../models/sign.dart';
import '../interfaces/auth_interface.dart';

class AuthDataSource extends AuthInterface {
  @override
  Future<BaseResponse> checkEmail(data) async {
    BaseResponse response = await CoreHttp.instance.send(
      ApiUrlConstants.checkEmail,
      type: HttpTypes.post,
      data: {"email": data},
    );

    return response;
  }

  @override
  Future<BaseResponse<Sign>> signIn(data) async {
    BaseResponse<Sign> response = await CoreHttp.instance.send<Sign, Sign>(
      ApiUrlConstants.signIn,
      type: HttpTypes.post,
      fromJson: Sign.fromJson,
      data: data,
    );

    return response;
  }

  @override
  Future<BaseResponse<Sign>> signUp(data) async {
    BaseResponse<Sign> response = await CoreHttp.instance.send<Sign, Sign>(
      ApiUrlConstants.auth,
      type: HttpTypes.post,
      fromJson: Sign.fromJson,
      data: data,
    );

    return response;
  }
}
