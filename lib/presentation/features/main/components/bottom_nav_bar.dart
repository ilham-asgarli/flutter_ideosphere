import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../utils/ui/constants/colors/app_colors.dart';
import '../../../components/custom_circle_button.dart';
import '../state/cubit/main-nav-bar/main_nav_bar_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: AppColors.mainColor,
      child: Column(
        children: [
          const Divider(
            height: 0,
            color: AppColors.mainColor2,
          ),
          Padding(
            padding: context.paddingLow,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButton(context, 0),
                buildButton(context, 1),
                buildButton(context, 2),
                buildButton(context, 3),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context, int index) {
    return CustomCircleButton(
      color: context.watch<MainNavBarCubit>().state.index == index
          ? null
          : Colors.transparent,
      child: FaIcon(
        icon(index),
        size: 20,
      ),
      onTap: () {
        BlocProvider.of<MainNavBarCubit>(context).changeTab(index);
      },
    );
  }

  IconData? icon(index) {
    switch (index) {
      case 0:
        return FontAwesomeIcons.house;
      case 1:
        return FontAwesomeIcons.magnifyingGlass;
      case 2:
        return FontAwesomeIcons.comments;
      case 3:
        return FontAwesomeIcons.user;
      default:
        return null;
    }
  }
}
