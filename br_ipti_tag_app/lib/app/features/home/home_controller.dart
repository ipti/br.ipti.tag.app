import 'dart:async';
import 'package:br_ipti_tag_app/app/features/home/home_events.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeController extends Disposable {
  StreamController<HomeEvent> states = StreamController.broadcast();

  Future<void> fetchUsers() async {
    states.add(HomeLoading());
  }

  void navigateToLogin() {
    Modular.to.pushNamed("/login");
  }

  @override
  void dispose() {
    states.close();
  }
}
