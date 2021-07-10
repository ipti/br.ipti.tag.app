import 'dart:async';

import 'package:br_ipti_tag_app/app/domain/data/entities/user.dart';
import 'package:br_ipti_tag_app/app/modules/home/home_events.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeController extends Disposable {
  List<User> users = [];

  StreamController<HomeEvent> states = StreamController.broadcast();

  fetchUsers() async {
    states.add(HomeLoading());
  }

  filterUsers(String filterName) {
    final filteredUsers = users.where((user) => user.matricula == filterName);
    states.add(HomeReady(filteredUsers));
  }

  initListener() {
    states.stream.listen((event) {
      if (event is HomeReady) {
        users = event.users;
      }
    });
  }

  navigateToLogin() {
    Modular.to.pushNamed("/login");
  }

  @override
  void dispose() {
    states.close();
  }
}
