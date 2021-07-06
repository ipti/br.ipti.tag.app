import 'package:flutter/foundation.dart';

class MenuController {
  static final MenuController _menuController = new MenuController._internal();
  ValueNotifier<int> indexMenuItem = ValueNotifier(-1);
  ValueNotifier<int> indexMenuGroup = ValueNotifier(-1);

  factory MenuController() {
    return _menuController;
  }
  MenuController._internal();
}

final menuController = MenuController();
