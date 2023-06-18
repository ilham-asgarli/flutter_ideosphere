import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../core/extensions/context_extension.dart';
import '../../../../../../data/models/event.dart';
import '../../../../../../utils/logic/state/cubit/chat-socket/chat_socket_cubit.dart';
import '../state/cubit/home_cubit.dart';

class CustomMap extends StatelessWidget {
  const CustomMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeCubit readHomeCubit = context.read<HomeCubit>();

    return GoogleMap(
      padding: EdgeInsets.only(
        top: context.topPadding,
      ),
      initialCameraPosition: CameraPosition(
        target: readHomeCubit.state.myPosition,
        zoom: 10.5,
      ),
      onMapCreated: readHomeCubit.homeViewModel.onMapCreated,
      markers: context.watch<ChatSocketCubit>().state.closeEvents.map(
        (e) {
          return buildMarker(e, context);
        },
      ).toSet(),
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
    );
  }

  Marker buildMarker(Event e, BuildContext context) {
    final HomeCubit readHomeCubit = context.read<HomeCubit>();

    return Marker(
      markerId: MarkerId(e.id),
      position: LatLng(e.location.latitude, e.location.longitude),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        (context.watch<HomeCubit>().state.isChosenMarker &&
                e.id ==
                    context
                        .watch<HomeCubit>()
                        .state
                        .chosenMarker
                        .markerId
                        .value)
            ? BitmapDescriptor.hueAzure
            : BitmapDescriptor.hueRed,
      ),
      onTap: () {
        readHomeCubit.homeViewModel.onTapMarker(
          Marker(
            markerId: MarkerId(e.id),
            position: LatLng(e.location.latitude, e.location.longitude),
          ),
        );
      },
    );
  }
}
