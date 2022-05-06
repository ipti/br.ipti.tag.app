import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'tab_controller_state.dart';

class TabControllerCubit extends Cubit<TabControllerState> {
  TabControllerCubit() : super(const ValueChanged(value: 0));

  Future<void> valueChanged({required int value}) async {
    emit(
      ValueChanged(
        value: value,
      ),
    );
  }
}
