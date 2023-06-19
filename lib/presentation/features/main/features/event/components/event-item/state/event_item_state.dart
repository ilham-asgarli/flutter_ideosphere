part of 'event_item_cubit.dart';

class EventItemState {
  final bool joiningEvent;

  const EventItemState({
    this.joiningEvent = false,
  });

  EventItemState copyWith({
    bool? joiningEvent,
  }) {
    return EventItemState(
      joiningEvent: joiningEvent ?? this.joiningEvent,
    );
  }
}
