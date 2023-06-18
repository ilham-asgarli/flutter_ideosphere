part of 'pick_location_cubit.dart';

class PickLocationState {
  final Place? place;

  const PickLocationState({
    this.place,
  });

  PickLocationState copyWith({
    Place? place,
  }) {
    return PickLocationState(
      place: place ?? this.place,
    );
  }
}
