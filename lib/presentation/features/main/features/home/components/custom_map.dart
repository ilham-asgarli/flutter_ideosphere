import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../core/extensions/context_extension.dart';
import '../../../../../../utils/logic/helpers/google-maps/google_maps_helper.dart';
import '../state/cubit/home_cubit.dart';

class CustomMap extends StatelessWidget {
  const CustomMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeCubit readHomeCubit = context.read<HomeCubit>();
    final HomeCubit watchHomeCubit = context.watch<HomeCubit>();

    return GoogleMap(
      padding: EdgeInsets.only(
        top: context.topPadding,
      ),
      initialCameraPosition: CameraPosition(
        target: readHomeCubit.state.myPosition,
        zoom: 10.5,
      ),
      onMapCreated: (controller) async {
        /*String dark =
                  await rootBundle.loadString('assets/google-maps/dark.txt');
              controller.setMapStyle(dark);*/

        readHomeCubit.homeViewModel.controller = controller;
        readHomeCubit.setMyPosition(
          await GoogleMapsHelper.instance.animateCameraToMyLocation(controller),
        );
      },
      markers: readHomeCubit.homeViewModel.events.map(
        (e) {
          return Marker(
            markerId: MarkerId(e[0]),
            position: LatLng(
              e[1][0],
              e[1][1],
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              e[0] == watchHomeCubit.state.markerId
                  ? BitmapDescriptor.hueAzure
                  : BitmapDescriptor.hueRed,
            ),
            onTap: () {
              readHomeCubit.homeViewModel.onTapMarker(context, e[0]);
            },
          );
        },
      ).toSet(),
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
    );
  }
}
