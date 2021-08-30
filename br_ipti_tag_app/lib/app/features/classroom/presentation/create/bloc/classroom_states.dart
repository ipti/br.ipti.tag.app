import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

abstract class ClassroomCreateState extends Equatable {}

class ClassroomCreateFormState extends ClassroomCreateState {
  ClassroomCreateFormState({
    @required this.name,
    @required this.startTime,
    @required this.endTime,
    @required this.modalityId,
    @required this.stageId,
    @required this.typePedagogicMediationId,
  });

  final String name;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final int modalityId;
  final int stageId;
  final int typePedagogicMediationId;

  ClassroomCreateFormState copyWith({
    String name,
    TimeOfDay startTime,
    TimeOfDay endTime,
    int modalityId,
    int stageId,
    int typePedagogicMediationId,
  }) {
    return ClassroomCreateFormState(
      name: name ?? this.name,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      modalityId: modalityId ?? this.modalityId,
      stageId: stageId ?? this.stageId,
      typePedagogicMediationId:
          typePedagogicMediationId ?? this.typePedagogicMediationId,
    );
  }

  @override
  List<Object> get props {
    return [
      name,
      startTime,
      endTime,
      modalityId,
      stageId,
      typePedagogicMediationId,
    ];
  }
}
