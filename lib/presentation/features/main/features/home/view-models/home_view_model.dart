import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../state/cubit/home_cubit.dart';

class HomeViewModel {
  late final GoogleMapController controller;
  PageController pageController = PageController(
    viewportFraction: 0.9,
  );

  List<List> events = [
    [
      "0",
      [
        41.11213,
        28.9790,
      ],
    ],
    [
      "1",
      [
        41.015137,
        28.979530,
      ],
    ],
    [
      "2",
      [
        41.01519,
        28.8794,
      ],
    ],
  ];

  void onTapMarker(BuildContext context, Marker marker) {
    final HomeCubit readHomeCubit = context.read<HomeCubit>();

    if (readHomeCubit.state.isChosenMarker) {
      if (readHomeCubit.state.chosenMarker.markerId.value !=
          marker.markerId.value) {
        // TODO get marker index and change selected page
        pageController.animateToPage(
          int.parse(marker.markerId.value),
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      } else {
        readHomeCubit.changeChosenEvent(marker);
      }
    } else {
      readHomeCubit.changeChosenEvent(marker);
    }
  }

  void onEventPageChanged(BuildContext context, int index) {
    final HomeCubit readHomeCubit = context.read<HomeCubit>();

    // TODO get marker id and change chosen marker
    try {
      List<dynamic> marker =
          events.firstWhere((element) => element[0] == index.toString());

      readHomeCubit.changeChosenEvent(
        Marker(
          markerId: MarkerId(
            index.toString(),
          ),
          position: LatLng(marker[1][0], marker[1][1]),
        ),
      );
    } catch (e) {
      readHomeCubit.changeChosenEvent(readHomeCubit.state.chosenMarker);
    }
  }
}
