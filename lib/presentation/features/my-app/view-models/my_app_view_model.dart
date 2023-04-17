import 'package:flutter/cupertino.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../../../core/base/view-models/base_view_model.dart';
import '../../../../utils/logic/constants/router/router_constants.dart';

class MyAppViewModel extends BaseViewModel {
  MyAppViewModel(super.context);

  void removeSplashScreen(BuildContext context) async {
    FlutterNativeSplash.remove();
  }

  String getInitialRoute() {
    return RouterConstants.sign;
  }
}
