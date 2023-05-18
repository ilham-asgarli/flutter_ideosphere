import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../view-models/home_view_model.dart';

part 'home_state.dart';

class HomeCubit extends HydratedCubit<HomeState> {
  final HomeViewModel homeViewModel = HomeViewModel();

  HomeCubit() : super(HomeState());

  Future<void> setMyPosition(Position position) async {
    emit(
      state.copyWith(
        myPosition: LatLng(position.latitude, position.longitude),
      ),
    );
  }

  void changeEvent(String? markerId) {
    emit(state.copyWith(
      markerId: markerId == state.markerId ? "" : markerId,
    ));
  }

  @override
  HomeState? fromJson(Map<String, dynamic> json) {
    final myPosition = json["myPosition"];

    return HomeState(
      myPosition: LatLng(
        myPosition["lat"],
        myPosition["lng"],
      ),
    );
  }

  @override
  Map<String, dynamic>? toJson(HomeState state) {
    return {
      "myPosition": {
        "lat": state.myPosition.latitude,
        "lng": state.myPosition.longitude,
      },
    };
  }
}
