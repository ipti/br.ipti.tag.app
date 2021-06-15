import 'package:br_ipti_tag_app/app/domain/data/entities/user.dart';

class HomeEvent {}

class HomeLoading extends HomeEvent {}

class HomeReady extends HomeEvent {
  final List<User> users;

  HomeReady(this.users);
}

class HomeError extends HomeEvent {
  final Exception exception;

  HomeError(this.exception);
}
