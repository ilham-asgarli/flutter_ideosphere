import '../../../models/create_event_model.dart';

abstract class EventInterface {
  Future<void> createEvent(CreateEventModel data);
}
