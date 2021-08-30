class HomeEvent {}

class HomeLoading extends HomeEvent {}

class HomeError extends HomeEvent {
  HomeError(this.exception);

  final Exception exception;
}
