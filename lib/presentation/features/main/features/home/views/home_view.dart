import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../core/extensions/context_extension.dart';
import '../../../../../../utils/logic/helpers/google-maps/google_maps_helper.dart';
import '../../../../../../utils/ui/constants/colors/app_colors.dart';
import '../../../../../components/custom_circle_button.dart';
import '../components/event_card.dart';
import '../state/cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeCubit readHomeCubit = context.read<HomeCubit>();
    HomeCubit watchHomeCubit = context.watch<HomeCubit>();
    HomeState homeState = watchHomeCubit.state;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(
              top: context.topPadding,
            ),
            initialCameraPosition: CameraPosition(
              target: LatLng(
                homeState.cameraPosition.first,
                homeState.cameraPosition.last,
              ),
              zoom: 10.5,
            ),
            onMapCreated: (controller) async {
              /*String dark =
                  await rootBundle.loadString('assets/google-maps/dark.txt');
              controller.setMapStyle(dark);*/

              readHomeCubit.homeViewModel.controller = controller;
              readHomeCubit.setPosition(
                await GoogleMapsHelper.instance
                    .animateCameraToMyLocation(controller),
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
                  onTap: () => readHomeCubit.changeEvent(e[0]),
                );
              },
            ).toSet(),
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
          ),
          const Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: EventCard(),
            ),
          ),
          Positioned(
            top: context.topPadding + 3,
            right: 10,
            child: CustomCircleButton(
              color: AppColors.mainColor2,
              child: const FaIcon(
                FontAwesomeIcons.locationCrosshairs,
              ),
              onTap: () async {
                readHomeCubit.setPosition(
                  await GoogleMapsHelper.instance.animateCameraToMyLocation(
                    readHomeCubit.homeViewModel.controller,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
