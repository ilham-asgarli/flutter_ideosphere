import '../../../../core/base/models/base_response.dart';
import '../../../../core/cache/shared_preferences_manager.dart';
import '../../../../core/constants/enums/http_request_enum.dart';
import '../../../../core/network/core/core_http.dart';
import '../../../../utils/logic/constants/api/api_url_constants.dart';
import '../../../../utils/logic/constants/cache/shared_preferences_constants.dart';
import '../interfaces/event_interface.dart';

class EventDataSource extends EventInterface {
  @override
  Future<BaseResponse> createEvent(data) async {
    BaseResponse response = await CoreHttp.instance.send(
      ApiUrlConstants.events,
      type: HttpTypes.post,
      data: data,
      accessToken: SharedPreferencesManager.instance.preferences
          ?.getString(SharedPreferencesConstants.accessToken),
    );

    return response;
  }

  @override
  Future<BaseResponse> joinEvent(String eventId) async {
    BaseResponse response = await CoreHttp.instance.send(
      ApiUrlConstants.eventParticipant(eventId),
      type: HttpTypes.post,
      accessToken: SharedPreferencesManager.instance.preferences
          ?.getString(SharedPreferencesConstants.accessToken),
    );

    return response;
  }
}
