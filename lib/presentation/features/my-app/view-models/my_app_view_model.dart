import 'package:flutter/cupertino.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../../../core/base/view-models/base_view_model.dart';
import '../../../../core/cache/shared_preferences_manager.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../utils/logic/constants/cache/shared_preferences_constants.dart';
import '../../../../utils/logic/constants/router/router_constants.dart';

class MyAppViewModel extends BaseViewModel {
  MyAppViewModel(super.context);

  void removeSplashScreen(BuildContext context) async {
    FlutterNativeSplash.remove();
  }

  String getInitialRoute() {
    String? accessToken = SharedPreferencesManager.instance.preferences
        ?.getString(SharedPreferencesConstants.accessToken);

    if (accessToken.isNotNull && accessToken!.isNotEmpty) {
      return RouterConstants.main;
    }
    return RouterConstants.sign;
  }
}
