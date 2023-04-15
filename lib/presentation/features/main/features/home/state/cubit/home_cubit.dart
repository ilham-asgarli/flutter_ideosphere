import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../view-models/home_view_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeViewModel homeViewModel = HomeViewModel();

  HomeCubit() : super(HomeState());

  Future<void> setPosition(Position position) async {
    emit(
      state.copyWith(
        cameraPosition: [position.latitude, position.longitude],
      ),
    );
  }

  void changeEvent(String? markerId) {
    emit(state.copyWith(
      markerId: markerId == state.markerId ? "" : markerId,
    ));
  }
}
