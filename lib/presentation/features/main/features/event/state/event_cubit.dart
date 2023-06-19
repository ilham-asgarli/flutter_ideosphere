import 'package:bloc/bloc.dart';

import '../../../../../../data/models/event.dart';
import '../view-models/event_view_model.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  final Event eventModel;

  EventCubit(this.eventModel) : super(const EventState()) {
    eventViewModel = EventViewModel(this);
  }

  late final EventViewModel eventViewModel;
}
