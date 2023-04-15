part of 'home_cubit.dart';

class HomeState {
  final List<double> cameraPosition;

  HomeState({
    this.cameraPosition = const [41.015137, 28.979530],
  });

  HomeState copyWith({
    List<double>? cameraPosition,
  }) {
    return HomeState(
      cameraPosition: cameraPosition ?? this.cameraPosition,
    );
  }
}
