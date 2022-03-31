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
    required int value,
  }) : super(
          value: value,
        );

  @override
  List<Object?> get props => [value];
}
