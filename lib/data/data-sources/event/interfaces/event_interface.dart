import '../../../../core/base/models/base_response.dart';

abstract class EventInterface {
  Future<BaseResponse> createEvent(data);
}
