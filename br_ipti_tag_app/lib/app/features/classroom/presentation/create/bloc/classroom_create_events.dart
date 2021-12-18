import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ClassroomCreateEvent extends Equatable {
  const ClassroomCreateEvent();

  @override
  List<Object> get props => [];
}

class StartEditing extends ClassroomCreateEvent {}

class SubmitClassroom extends ClassroomCreateEvent {}

class SubmitedSuccess extends ClassroomCreateEvent {}

class NameChanged extends ClassroomCreateEvent {
  const NameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class StartTimeChanged extends ClassroomCreateEvent {
  const StartTimeChanged(this.startTime);

  final TimeOfDay startTime;

  @override
  List<Object> get props => [startTime];
}

class EndTimeChanged extends ClassroomCreateEvent {
  const EndTimeChanged(this.endTime);

  final TimeOfDay endTime;

  @override
  List<Object> get props => [endTime];
}

class ModalityChanged extends ClassroomCreateEvent {
  const ModalityChanged(this.modalityId);

  final int modalityId;

  @override
  List<Object> get props => [modalityId];
}

class StageChanged extends ClassroomCreateEvent {
  const StageChanged(this.idEdcenso);

  final int idEdcenso;

  @override
  List<Object> get props => [idEdcenso];
}

class TypePedagogicalMediationChanged extends ClassroomCreateEvent {
  const TypePedagogicalMediationChanged(this.typePedagogicMediationId);

  final int typePedagogicMediationId;

  @override
  List<Object> get props => [typePedagogicMediationId];
}
