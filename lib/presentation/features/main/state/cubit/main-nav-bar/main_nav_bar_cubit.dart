import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/chat/views/chat_view.dart';
import '../../../features/flow/views/flow_view.dart';
import '../../../features/home/state/cubit/home_cubit.dart';
import '../../../features/home/views/home_view.dart';
import '../../../features/profile/views/profile_view.dart';

part 'main_nav_bar_state.dart';

class MainNavBarCubit extends Cubit<MainNavBarState> {
  final List<Widget> items = [
    BlocProvider(
      create: (context) => HomeCubit(),
      child: const HomeView(),
    ),
    const ChatView(),
    const FlowView(),
    const ProfileView(),
  ];

  MainNavBarCubit() : super(const MainNavBarState(0));

  void changeTab(index) {
    emit(MainNavBarState(index));
  }
}
