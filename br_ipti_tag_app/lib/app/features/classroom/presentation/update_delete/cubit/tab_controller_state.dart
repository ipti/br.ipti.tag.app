part of 'tab_controller_cubit.dart';

@immutable
abstract class TabControllerState extends Equatable {
  const TabControllerState({
    required this.value,
  });
  final int value;
}

class ValueChanged extends TabControllerState {
  const ValueChanged({
    required super.value,
  });

  @override
  List<Object?> get props => [value];
}
