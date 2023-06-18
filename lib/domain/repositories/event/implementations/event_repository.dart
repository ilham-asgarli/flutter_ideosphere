import '../../../../core/base/models/base_success.dart';
import '../../../../data/data-sources/event/implementations/event_data_source.dart';
import '../../../models/create_event_model.dart';
import '../interfaces/event_interface.dart';

class EventRepository extends EventInterface {
  final EventDataSource eventDataSource = EventDataSource();

  @override
  Future<void> createEvent(CreateEventModel data) async {
    final response = await eventDataSource.createEvent(data.toJson());

    if (response is! BaseSuccess) throw Error();
  }
}
