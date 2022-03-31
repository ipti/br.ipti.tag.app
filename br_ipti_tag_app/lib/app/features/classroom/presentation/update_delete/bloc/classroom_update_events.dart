import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ClassroomUpdateDeleteEvent extends Equatable {
  const ClassroomUpdateDeleteEvent();

  @override
  List<Object> get props => [];
}

class StartEditing extends ClassroomUpdateDeleteEvent {}

class SubmitClassroom extends ClassroomUpdateDeleteEvent {}

class SubmitedSuccess extends ClassroomUpdateDeleteEvent {}

class UpdateClassroom extends ClassroomUpdateDeleteEvent {
  const UpdateClassroom({
    required this.edcensoStageVsModalityFk,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.modalityId,
    required this.typePedagogicMeditationId,
    required this.stage,
    required this.id,
    this.schooling = false,
    this.complementaryActivity = false,
    this.aee = false,
    this.moreEducationParticipator = false,
    this.aeeBraille = false,
    this.aeeOpticalNonoptical = false,
    this.aeeCognitiveFunction = false,
    this.aeeMobilityTechniques = false,
    this.aeeLibras = false,
    this.aeeCaa = false,
    this.aeeCurriculumEnrichment = false,
    this.aeeSoroban = false,
    this.aeeAccessibleTeaching = false,
    this.aeePortuguese = false,
    this.aeeAutonomousLife = false,
  });
  final String edcensoStageVsModalityFk;
  final String name;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final int modalityId;
  final int typePedagogicMeditationId;
  final String stage;
  final String id;
  final bool schooling;
  final bool complementaryActivity;
  final bool aee;
  final bool moreEducationParticipator;
  final bool aeeBraille;
  final bool aeeOpticalNonoptical;
  final bool aeeCognitiveFunction;
  final bool aeeMobilityTechniques;
  final bool aeeLibras;
  final bool aeeCaa;
  final bool aeeCurriculumEnrichment;
  final bool aeeSoroban;
  final bool aeeAccessibleTeaching;
  final bool aeePortuguese;
  final bool aeeAutonomousLife;

  @override
  // TODO: implement props
  List<Object> get props => [
        edcensoStageVsModalityFk,
        name,
        startTime,
        endTime,
        modalityId,
        typePedagogicMeditationId,
        stage,
        id,
        schooling,
        complementaryActivity,
        aee,
        moreEducationParticipator,
        aeeBraille,
        aeeOpticalNonoptical,
        aeeCognitiveFunction,
        aeeMobilityTechniques,
        aeeLibras,
        aeeCaa,
        aeeCurriculumEnrichment,
        aeeSoroban,
        aeeAccessibleTeaching,
        aeePortuguese,
        aeeAutonomousLife,
      ];
}

class NameChanged extends ClassroomUpdateDeleteEvent {
  const NameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class AeeBrailleChanged extends ClassroomUpdateDeleteEvent {
  const AeeBrailleChanged({
    required this.aeeBraille,
  });

  final bool aeeBraille;

  @override
  List<Object> get props => [aeeBraille];
}

class AeeOpticalNonOpticalChanged extends ClassroomUpdateDeleteEvent {
  const AeeOpticalNonOpticalChanged({
    required this.aeeOpticalNonOptical,
  });

  final bool aeeOpticalNonOptical;

  @override
  List<Object> get props => [aeeOpticalNonOptical];
}

class AeeCognitiveFunctionsChanged extends ClassroomUpdateDeleteEvent {
  const AeeCognitiveFunctionsChanged({
    required this.aeeCognitiveFunctions,
  });

  final bool aeeCognitiveFunctions;

  @override
  List<Object> get props => [aeeCognitiveFunctions];
}

class AeeMobilityTechniquesChanged extends ClassroomUpdateDeleteEvent {
  const AeeMobilityTechniquesChanged({
    required this.aeeMobilityTechniques,
  });

  final bool aeeMobilityTechniques;

  @override
  List<Object> get props => [aeeMobilityTechniques];
}

class AeeLibrasChanged extends ClassroomUpdateDeleteEvent {
  const AeeLibrasChanged({
    required this.aeeLibras,
  });

  final bool aeeLibras;

  @override
  List<Object> get props => [aeeLibras];
}

class AeeCaaChanged extends ClassroomUpdateDeleteEvent {
  const AeeCaaChanged({
    required this.aeeCaa,
  });

  final bool aeeCaa;

  @override
  List<Object> get props => [aeeCaa];
}

class AeeCurriculumEnrichmentChanged extends ClassroomUpdateDeleteEvent {
  const AeeCurriculumEnrichmentChanged({
    required this.aeeCurriculumEnrichment,
  });

  final bool aeeCurriculumEnrichment;

  @override
  List<Object> get props => [aeeCurriculumEnrichment];
}

class AeeAccessibleTeachingChanged extends ClassroomUpdateDeleteEvent {
  const AeeAccessibleTeachingChanged({
    required this.aeeAccessibleTeaching,
  });

  final bool aeeAccessibleTeaching;

  @override
  List<Object> get props => [aeeAccessibleTeaching];
}

class AeePortugueseChanged extends ClassroomUpdateDeleteEvent {
  const AeePortugueseChanged({
    required this.aeePortuguese,
  });

  final bool aeePortuguese;

  @override
  List<Object> get props => [aeePortuguese];
}

class AeeSorobanChanged extends ClassroomUpdateDeleteEvent {
  const AeeSorobanChanged({
    required this.aeeSoroban,
  });

  final bool aeeSoroban;

  @override
  List<Object> get props => [aeeSoroban];
}

class AeeAutonomousLifeChanged extends ClassroomUpdateDeleteEvent {
  const AeeAutonomousLifeChanged({
    required this.aeeAutonomousLife,
  });

  final bool aeeAutonomousLife;

  @override
  List<Object> get props => [aeeAutonomousLife];
}

class MoreEducationParticipatorChanged extends ClassroomUpdateDeleteEvent {
  const MoreEducationParticipatorChanged({
    required this.moreEducationParticipator,
  });

  final bool moreEducationParticipator;

  @override
  List<Object> get props => [moreEducationParticipator];
}

class AeeChanged extends ClassroomUpdateDeleteEvent {
  const AeeChanged({required this.aee});

  final bool aee;

  @override
  List<Object> get props => [aee];
}

class ComplementaryActivityChanged extends ClassroomUpdateDeleteEvent {
  const ComplementaryActivityChanged({required this.complementaryActivity});

  final bool complementaryActivity;

  @override
  List<Object> get props => [complementaryActivity];
}

class SchoolingChanged extends ClassroomUpdateDeleteEvent {
  const SchoolingChanged({required this.schooling});

  final bool schooling;

  @override
  List<Object> get props => [schooling];
}

class StartTimeChanged extends ClassroomUpdateDeleteEvent {
  const StartTimeChanged(this.startTime);

  final TimeOfDay startTime;

  @override
  List<Object> get props => [startTime];
}

class EndTimeChanged extends ClassroomUpdateDeleteEvent {
  const EndTimeChanged(this.endTime);

  final TimeOfDay endTime;

  @override
  List<Object> get props => [endTime];
}

class ModalityChanged extends ClassroomUpdateDeleteEvent {
  const ModalityChanged(this.modalityId);

  final int modalityId;

  @override
  List<Object> get props => [modalityId];
}

class StageChanged extends ClassroomUpdateDeleteEvent {
  const StageChanged(this.idEdcenso);

  final int idEdcenso;

  @override
  List<Object> get props => [idEdcenso];
}

class TypePedagogicalMediationChanged extends ClassroomUpdateDeleteEvent {
  const TypePedagogicalMediationChanged(this.typePedagogicMediationId);

  final int typePedagogicMediationId;

  @override
  List<Object> get props => [typePedagogicMediationId];
}
