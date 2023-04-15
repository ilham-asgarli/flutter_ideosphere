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
      color: AppColors.mainColor1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: context.paddingNormal * 0.7,
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
      ),
    );
  }

  buildButton(BuildContext context, int index) {
    return CustomCircleButton(
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
