import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../view-models/home_view_model.dart';

part 'home_state.dart';

class HomeCubit extends HydratedCubit<HomeState> {
  final BuildContext context;

  HomeCubit(this.context) : super(const HomeState()) {
    homeViewModel = HomeViewModel(this, context);
  }

  late final HomeViewModel homeViewModel;

  Future<void> setMyPosition(Position position) async {
    emit(
      state.copyWith(
        myPosition: LatLng(position.latitude, position.longitude),
      ),
    );
  }

  void changeChosenEvent(Marker chosenMarker, {bool? triggerPageListener}) {
    emit(state.copyWith(
      chosenMarker: chosenMarker,
      isChosenMarker:
          chosenMarker.markerId.value != state.chosenMarker.markerId.value
              ? true
              : (!state.isChosenMarker),
      triggerPageListener: triggerPageListener,
    ));

    homeViewModel.controller.animateCamera(CameraUpdate.newLatLng(
      state.isChosenMarker ? state.chosenMarker.position : state.myPosition,
    ));
  }

  void changeTriggerPageListener(bool triggerPageListener) {
    emit(state.copyWith(
      triggerPageListener: triggerPageListener,
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
