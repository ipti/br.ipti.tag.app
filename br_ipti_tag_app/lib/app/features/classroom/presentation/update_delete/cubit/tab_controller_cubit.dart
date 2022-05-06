import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
