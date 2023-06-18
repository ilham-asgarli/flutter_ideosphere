part of 'home_cubit.dart';

class HomeState {
  final LatLng myPosition;
  final Marker chosenMarker;
  final bool isChosenMarker;
  final bool triggerPageListener;

  const HomeState({
    this.myPosition = const LatLng(41.015137, 28.979530),
    this.chosenMarker = const Marker(markerId: MarkerId("")),
    this.isChosenMarker = false,
    this.triggerPageListener = false,
  });

  HomeState copyWith({
    LatLng? myPosition,
    Marker? chosenMarker,
    bool? isChosenMarker,
    bool? triggerPageListener,
  }) {
    return HomeState(
      myPosition: myPosition ?? this.myPosition,
      chosenMarker: chosenMarker ?? this.chosenMarker,
      isChosenMarker: isChosenMarker ?? this.isChosenMarker,
      triggerPageListener: triggerPageListener ?? this.triggerPageListener,
    );
  }
}
