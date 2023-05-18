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

  onTapMarker(BuildContext context, String id) {
    HomeCubit readHomeCubit = context.read<HomeCubit>();

    if (readHomeCubit.state.markerId.isNotEmpty &&
        readHomeCubit.state.markerId != id) {
      // TODO get marker id and change selected page
      pageController.animateToPage(
        int.parse(id),
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      if (readHomeCubit.state.markerId.isEmpty) {
        // TODO get marker id and change pageView elements
      }

      readHomeCubit.changeEvent(id);
    }
  }

  onEventPageChanged(BuildContext context, int index) {
    HomeCubit readHomeCubit = context.read<HomeCubit>();

    // TODO get marker id and change chosen marker
    try {
      List<dynamic> marker =
          events.firstWhere((element) => element[0] == index.toString());

      readHomeCubit.changeEvent(index.toString());
      controller.animateCamera(
          CameraUpdate.newLatLng(LatLng(marker[1][0], marker[1][1])));
    } catch (e) {
      readHomeCubit.changeEvent("");
      controller.animateCamera(
        CameraUpdate.newLatLng(readHomeCubit.state.myPosition),
      );
    }
  }
}
