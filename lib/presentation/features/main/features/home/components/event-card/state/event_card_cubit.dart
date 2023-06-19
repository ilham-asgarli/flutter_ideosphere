import 'package:bloc/bloc.dart';

part 'event_card_state.dart';

class EventCardCubit extends Cubit<EventCardState> {
  EventCardCubit() : super(const EventCardState());

  changeJoiningEvent(bool joiningEvent) {
    emit(state.copyWith(
      joiningEvent: joiningEvent,
    ));
  }
}
