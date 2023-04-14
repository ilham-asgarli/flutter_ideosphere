import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../utils/ui/constants/colors/app_colors.dart';
import '../state/cubit/main-nav-bar/main_nav_bar_cubit.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: IndexedStack(
                index: context.watch<MainNavBarCubit>().state.index,
                children: context.read<MainNavBarCubit>().items,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  Widget buildBottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        currentIndex: context.watch<MainNavBarCubit>().state.index,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade400,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.mainColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            label: "",
            icon: FaIcon(
              FontAwesomeIcons.house,
              size: 20,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              size: 20,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: FaIcon(
              FontAwesomeIcons.comments,
              size: 20,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: FaIcon(
              FontAwesomeIcons.user,
              size: 20,
            ),
          ),
        ],
        onTap: (index) {
          BlocProvider.of<MainNavBarCubit>(context).changeTab(index);
        },
      ),
    );
  }
}
