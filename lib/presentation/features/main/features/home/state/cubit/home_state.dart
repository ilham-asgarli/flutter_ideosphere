part of 'home_cubit.dart';

class HomeState {
  final List<double> cameraPosition;
  final String markerId;

  HomeState({
    this.cameraPosition = const [41.015137, 28.979530],
    this.markerId = "",
  });

  HomeState copyWith({
    List<double>? cameraPosition,
    String? markerId,
  }) {
    return HomeState(
      cameraPosition: cameraPosition ?? this.cameraPosition,
      markerId: markerId ?? this.markerId,
    );
  }
}
