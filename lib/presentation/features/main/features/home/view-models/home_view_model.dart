import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../utils/logic/helpers/google-maps/google_maps_helper.dart';
import '../../../../../../utils/logic/state/cubit/chat-socket/chat_socket_cubit.dart';
import '../state/cubit/home_cubit.dart';

class HomeViewModel {
  final HomeCubit homeCubit;
  final BuildContext context;

  HomeViewModel(this.homeCubit, this.context);

  late final GoogleMapController controller;
  final PageController pageController = PageController(
    viewportFraction: 0.9,
  );

  void onMapCreated(GoogleMapController controller) async {
    /*String dark =
                  await rootBundle.loadString('assets/google-maps/dark.txt');
              controller.setMapStyle(dark);*/

    this.controller = controller;

    Position position =
        await GoogleMapsHelper.instance.animateCameraToMyLocation(controller);
    homeCubit.setMyPosition(
      position,
    );

    if (context.mounted) {
      context.read<ChatSocketCubit>().channel.sink.add(
            jsonEncode({
              'name': 'close-events',
              'body': {
                "latitude": position.latitude,
                "longitude": position.longitude,
                "radius": 1,
              },
            }),
          );
    }
  }

  void onTapMarker(Marker marker) {
    if (homeCubit.state.isChosenMarker) {
      if (homeCubit.state.chosenMarker.markerId.value !=
          marker.markerId.value) {
        animateToEvent(marker);
      } else {
        homeCubit.changeChosenEvent(marker);
      }
    } else {
      homeCubit.changeChosenEvent(marker, triggerPageListener: false);
      animateToEvent(marker);
    }
  }

  void animateToEvent(Marker marker) {
    int page = context
        .read<ChatSocketCubit>()
        .state
        .closeEvents
        .indexWhere((element) => element.id == marker.markerId.value);

    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void onEventPageChanged(int index) {
    if (!homeCubit.state.triggerPageListener) {
      homeCubit.changeTriggerPageListener(true);
      return;
    }

    try {
      var event = context.read<ChatSocketCubit>().state.closeEvents[index];
      var marker = event.location;

      homeCubit.changeChosenEvent(
        Marker(
          markerId: MarkerId(
            event.id,
          ),
          position: LatLng(marker.latitude, marker.longitude),
        ),
      );
    } catch (e) {
      homeCubit.changeChosenEvent(homeCubit.state.chosenMarker);
    }
  }
}
