import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../presentation/features/main/state/cubit/main-nav-bar/main_nav_bar_cubit.dart';
import '../../../../presentation/features/main/views/main_view.dart';
import '../../../../presentation/features/not-found-navigation/views/not_found_navigation_view.dart';
import '../../../../presentation/features/sign/features/sign-in/views/sign_in_view.dart';
import '../../../../presentation/features/sign/features/sign-up/views/sign_up_view.dart';
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
          create: (context) => MainNavBarCubit(),
          child: const MainView(),
        );
        break;
      case RouterConstants.sign:
        widget = BlocProvider(
          create: (context) => SignCubit(),
          child: const SignView(),
        );
        break;
      case RouterConstants.signUp:
        widget = const SignUpView();
        break;
      case RouterConstants.signIn:
        widget = const SignInView();
        break;
      default:
        //throw NavigateException<SettingsDynamicModel>(args.arguments);
        return normalNavigate(
          const NotFoundNavigationView(),
          RouterConstants.notFound,
        );
    }

    return normalNavigate(
      widget,
      settings.name!,
    );
  }
}
