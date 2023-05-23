import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/extensions/context_extension.dart';
import '../../../../../../core/extensions/num_extension.dart';
import '../../../../../../core/router/core/router_service.dart';
import '../../../../../../utils/logic/constants/router/router_constants.dart';
import '../../../../../../utils/logic/helpers/google-maps/google_maps_helper.dart';
import '../../../../../../utils/ui/constants/colors/app_colors.dart';
import '../../../../../components/custom_circle_button.dart';
import '../../../../../widgets/sliding_widget.dart';
import '../components/custom_map.dart';
import '../components/event_page_view.dart';
import '../state/cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeCubit readHomeCubit = context.read<HomeCubit>();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Stack(
        children: [
          const CustomMap(),
          Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SlidingWidget(
                child: const EventPageView(),
                onHide: () {
                  readHomeCubit
                      .changeChosenEvent(readHomeCubit.state.chosenMarker);
                },
              ),
            ),
          ),
          Positioned(
            top: context.topPadding + 3,
            right: 10,
            child: Column(
              children: [
                CustomCircleButton(
                  color: AppColors.mainColor2,
                  child: const FaIcon(
                    FontAwesomeIcons.locationCrosshairs,
                  ),
                  onTap: () async {
                    readHomeCubit.setMyPosition(
                      await GoogleMapsHelper.instance.animateCameraToMyLocation(
                        readHomeCubit.homeViewModel.controller,
                      ),
                    );
                  },
                ),
                5.verticalSpace,
                CustomCircleButton(
                  color: AppColors.mainColor2,
                  child: const FaIcon(
                    FontAwesomeIcons.plus,
                    size: 15,
                  ),
                  onTap: () {
                    RouterService.instance.pushNamed(
                      path: RouterConstants.startEvent,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
