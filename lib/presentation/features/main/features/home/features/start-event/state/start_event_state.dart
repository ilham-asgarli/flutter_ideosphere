part of 'start_event_cubit.dart';

class StartEventState {
  final bool creating;

  StartEventState({
    this.creating = false,
  });

  StartEventState copyWith({
    bool? creating,
  }) {
    return StartEventState(
      creating: creating ?? this.creating,
    );
  }
}
