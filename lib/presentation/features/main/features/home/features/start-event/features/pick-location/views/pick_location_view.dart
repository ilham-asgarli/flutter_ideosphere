import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../../../../../core/constants/app/app_localizations.dart';
import '../../../../../../../../../../core/extensions/context_extension.dart';
import '../../../../../../../../../../core/extensions/string_extension.dart';
import '../../../../../../../../../../core/router/core/router_service.dart';
import '../../../../../../../../../../data/models/place.dart';
import '../../../../../../../../../../utils/ui/constants/colors/app_colors.dart';
import '../../../../../../../../../components/custom_button.dart';
import '../../../../../state/cubit/home_cubit.dart';
import '../state/pick_location_cubit.dart';

class PickLocationView extends StatelessWidget {
  const PickLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    PickLocationCubit pickLocationCubit =
        BlocProvider.of<PickLocationCubit>(context);

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(
              top: context.topPadding,
            ),
            initialCameraPosition: CameraPosition(
              target: context.read<HomeCubit>().state.myPosition,
              zoom: 10.5,
            ),
            onCameraIdle: pickLocationCubit.pickLocationViewModel.onCameraIdle,
            onMapCreated: (controller) async {
              pickLocationCubit.pickLocationViewModel.googleMapController =
                  controller;
            },
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
          ),
          Positioned(
            top: context.topPadding + context.normalValue,
            left: context.normalValue,
            right: context.normalValue,
            child: Card(
              margin: EdgeInsets.zero,
              color: AppColors.secondColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: context.paddingLow,
                child: Center(
                  child: context.watch<PickLocationCubit>().state.place != null
                      ? Text(
                          context
                                  .read<PickLocationCubit>()
                                  .state
                                  .place
                                  ?.formattedAddress ??
                              "",
                          style: const TextStyle(
                            color: AppColors.mainColor,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: null,
                          overflow: TextOverflow.visible,
                        )
                      : const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: AppColors.thirdColor,
                          ),
                        ),
                ),
              ),
            ),
          ),
          Center(
            child: Image.asset(
              "ic_marker".toPNG,
              width: 50,
              height: 50,
            ),
          ),
          Positioned(
            left: context.lowValue / 2,
            right: context.lowValue / 2,
            bottom: context.lowValue / 2,
            child: CustomButton(
              height: 50,
              text: AppLocalizations.of(context)!.continue_,
              onTap: () {
                RouterService.instance.pop<Place>(
                  context,
                  pickLocationCubit.state.place,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
