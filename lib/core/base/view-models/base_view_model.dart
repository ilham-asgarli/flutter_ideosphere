import 'package:flutter/widgets.dart';

abstract class BaseViewModel {
  BuildContext context;

  BaseViewModel(this.context) {
    init();
  }

  void init() {}
}
