import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/chat.dart';
import '../../../../data/models/event.dart';
import '../../../../data/models/place.dart';
import '../../../../presentation/features/main/features/chats/features/chat/state/chat_cubit.dart';
import '../../../../presentation/features/main/features/chats/features/chat/views/chat_view.dart';
import '../../../../presentation/features/main/features/event/views/event_view.dart';
import '../../../../presentation/features/main/features/home/features/start-event/features/pick-location/state/pick_location_cubit.dart';
import '../../../../presentation/features/main/features/home/features/start-event/features/pick-location/views/pick_location_view.dart';
import '../../../../presentation/features/main/features/home/features/start-event/state/start_event_cubit.dart';
import '../../../../presentation/features/main/features/home/features/start-event/views/start_event_view.dart';
import '../../../../presentation/features/main/state/cubit/main-nav-bar/main_cubit.dart';
import '../../../../presentation/features/main/views/main_view.dart';
import '../../../../presentation/features/not-found-navigation/views/not_found_navigation_view.dart';
import '../../../../presentation/features/sign/state/cubit/sign_cubit.dart';
import '../../../../presentation/features/sign/views/sign_view.dart';
import '../../constants/router/router_constants.dart';
import 'interfaces/router_interface.dart';

class ConfigRouter extends RouterInterface {
  static final ConfigRouter instance = ConfigRouter._init();

  ConfigRouter._init();

  @override
  Route<dynamic> generateRoute(RouteSettings settings) {
    final Widget widget;

    switch (settings.name) {
      case RouterConstants.main:
        widget = BlocProvider(
          create: (context) => MainCubit(context),
          child: const MainView(),
        );
        break;
      case RouterConstants.sign:
        widget = BlocProvider(
          create: (context) => SignCubit(),
          child: const SignView(),
        );
        break;
      case RouterConstants.chat:
        widget = BlocProvider(
          create: (context) => ChatCubit(
            context,
            settings.arguments as Chat,
          ),
          child: const ChatView(),
        );
        break;
      case RouterConstants.startEvent:
        widget = BlocProvider(
          create: (context) => StartEventCubit(context),
          child: const StartEventView(),
        );
        break;
      case RouterConstants.event:
        widget = EventView(
          eventModel: settings.arguments as Event,
        );
        break;
      case RouterConstants.pickLocation:
        widget = BlocProvider(
          create: (context) => PickLocationCubit(),
          child: const PickLocationView(),
        );
        return normalNavigate<Place>(
          widget,
          settings,
        );
      default:
        //throw NavigateException<SettingsDynamicModel>(args.arguments);
        return normalNavigate(
          const NotFoundNavigationView(),
          const RouteSettings(name: RouterConstants.notFound),
        );
    }

    return normalNavigate(
      widget,
      settings,
    );
  }
}
