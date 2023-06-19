import 'package:bloc/bloc.dart';

part 'event_item_state.dart';

class EventItemCubit extends Cubit<EventItemState> {
  EventItemCubit() : super(const EventItemState());

  changeJoiningEvent(bool joiningEvent) {
    emit(state.copyWith(
      joiningEvent: joiningEvent,
    ));
  }
}
