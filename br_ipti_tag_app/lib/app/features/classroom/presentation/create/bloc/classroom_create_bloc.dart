import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/crate_classroom_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'classroom_create_events.dart';
import 'classroom_states.dart';

final _initialState = ClassroomCreateFormState(
  name: "",
  startTime: TimeOfDay.now(),
  endTime: TimeOfDay.now(),
  modalityId: 0,
  stageId: 0,
  typePedagogicMediationId: 0,
);

class ClassroomCreateBloc
    extends Bloc<ClassroomCreateEvent, ClassroomCreateFormState> {
  ClassroomCreateBloc(this._usecaseCreateClassroom) : super(_initialState);

  final CreateClassroomUsecase _usecaseCreateClassroom;

  final modalitiesList = const <int, String>{
    0: "Ensino Regular",
    1: "Educação Especial",
    2: "Educação de Jovens e Adultos (EJA)",
  };

  final stagesList = const <int, String>{
    0: "Teste 1",
    1: "Teste 2",
    2: "Teste 3",
  };

  setName(String name) => add(NameChanged(name));
  setStartTime(TimeOfDay startTime) => add(StartTimeChanged(startTime));
  setEndTime(TimeOfDay endTime) => add(EndTimeChanged(endTime));
  setModality(num modalityId) => add(ModalityChanged(modalityId));
  setStage(num stageId) => add(StageChanged(stageId));

  @override
  Stream<ClassroomCreateFormState> mapEventToState(
      ClassroomCreateEvent event) async* {
    var newState = state;
    if (event is NameChanged) {
      newState = state.copyWith(name: event.name);
    } else if (event is StartTimeChanged) {
      newState = state.copyWith(startTime: event.startTime);
    } else if (event is EndTimeChanged) {
      newState = state.copyWith(endTime: event.endTime);
    } else if (event is ModalityChanged) {
      newState = state.copyWith(modalityId: event.modalityId);
    } else if (event is StageChanged) {
      newState = state.copyWith(stageId: event.stageId);
    } else if (event is TypePedagogicalMediationChanged) {
      newState = state.copyWith(
          typePedagogicMediationId: event.typePedagogicMediationId);
    } else if (event is SubmitClassroom) {
      final params = ParamsCreateClassroom(
          name: state.name,
          startTime: state.startTime.toString(),
          endTime: state.endTime.toString(),
          modalityId: state.modalityId,
          stageId: state.stageId);

      _usecaseCreateClassroom.call(params);
    }

    yield newState;
  }
}
