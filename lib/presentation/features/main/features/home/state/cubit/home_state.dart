part of 'home_cubit.dart';

class HomeState {
  final LatLng myPosition;
  final String markerId;

  HomeState({
    this.myPosition = const LatLng(41.015137, 28.979530),
    this.markerId = "",
  });

  HomeState copyWith({
    LatLng? myPosition,
    String? markerId,
  }) {
    return HomeState(
      myPosition: myPosition ?? this.myPosition,
      markerId: markerId ?? this.markerId,
    );
  }
}
