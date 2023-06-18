import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../utils/logic/state/cubit/chat-socket/chat_socket_cubit.dart';
import '../../../features/chats/state/chats_cubit.dart';
import '../../../features/chats/views/chats_view.dart';
import '../../../features/flow/views/flow_view.dart';
import '../../../features/home/views/home_view.dart';
import '../../../features/profile/views/profile_view.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final BuildContext context;

  MainCubit(this.context) : super(const MainState(0)) {
    context.read<ChatSocketCubit>().connect();
  }

  final List<Widget> items = [
    const HomeView(),
    const FlowView(),
    BlocProvider(
      create: (context) => ChatsCubit(),
      child: const ChatsView(),
    ),
    const ProfileView(),
  ];

  void changeTab(index) {
    emit(MainState(index));
  }
}
