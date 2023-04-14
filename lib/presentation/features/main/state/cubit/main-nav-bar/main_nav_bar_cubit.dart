import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../features/chat/views/chat_view.dart';
import '../../../features/flow/views/flow_view.dart';
import '../../../features/home/views/home_view.dart';
import '../../../features/profile/views/profile_view.dart';

part 'main_nav_bar_state.dart';

class MainNavBarCubit extends Cubit<MainNavBarState> {
  final List<Widget> items = [
    const HomeView(),
    const ChatView(),
    const FlowView(),
    const ProfileView(),
  ];

  MainNavBarCubit() : super(const MainNavBarState(0));

  void changeTab(index) {
    emit(MainNavBarState(index));
  }
}
