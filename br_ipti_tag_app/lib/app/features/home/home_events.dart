class HomeEvent {}

class HomeLoading extends HomeEvent {}

class HomeError extends HomeEvent {
  final Exception exception;

  HomeError(this.exception);
}
