part of 'event_card_cubit.dart';

class EventCardState {
  final bool joiningEvent;

  const EventCardState({
    this.joiningEvent = false,
  });

  EventCardState copyWith({
    bool? joiningEvent,
  }) {
    return EventCardState(
      joiningEvent: joiningEvent ?? this.joiningEvent,
    );
  }
}
