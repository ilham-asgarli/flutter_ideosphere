import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/bottom_nav_bar.dart';
import '../state/cubit/main-nav-bar/main_nav_bar_cubit.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: IndexedStack(
                index: context.watch<MainNavBarCubit>().state.index,
                children: context.read<MainNavBarCubit>().items,
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavBar(),
          ),
        ],
      ),
    );
  }
}
