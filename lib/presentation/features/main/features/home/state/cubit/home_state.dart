part of 'home_cubit.dart';

class HomeState {
  final LatLng myPosition;
  final Marker chosenMarker;
  final bool isChosenMarker;

  HomeState({
    this.myPosition = const LatLng(41.015137, 28.979530),
    this.chosenMarker = const Marker(markerId: MarkerId("")),
    this.isChosenMarker = false,
  });

  HomeState copyWith({
    LatLng? myPosition,
    Marker? chosenMarker,
    bool? isChosenMarker,
  }) {
    return HomeState(
      myPosition: myPosition ?? this.myPosition,
      chosenMarker: chosenMarker ?? this.chosenMarker,
      isChosenMarker: isChosenMarker ?? this.isChosenMarker,
    );
  }
}
