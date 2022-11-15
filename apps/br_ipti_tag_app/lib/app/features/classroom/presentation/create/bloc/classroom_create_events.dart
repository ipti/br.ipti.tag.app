import 'package:equatable/equatable.dart';

abstract class ClassroomCreateEvent extends Equatable {
  const ClassroomCreateEvent();

  @override
  List<Object> get props => [];
}

class StartEditing extends ClassroomCreateEvent {}

class SubmitClassroom extends ClassroomCreateEvent {
  final String id;

  const SubmitClassroom({required this.id});
  @override
  List<Object> get props => [
        id,
      ];
}

class SubmitedSuccess extends ClassroomCreateEvent {}

class NameChanged extends ClassroomCreateEvent {
  const NameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class AeeBrailleChanged extends ClassroomCreateEvent {
  const AeeBrailleChanged({
    required this.aeeBraille,
  });

  final bool aeeBraille;

  @override
  List<Object> get props => [aeeBraille];
}

class AeeOpticalNonOpticalChanged extends ClassroomCreateEvent {
  const AeeOpticalNonOpticalChanged({
    required this.aeeOpticalNonOptical,
  });

  final bool aeeOpticalNonOptical;

  @override
  List<Object> get props => [aeeOpticalNonOptical];
}

class AeeCognitiveFunctionsChanged extends ClassroomCreateEvent {
  const AeeCognitiveFunctionsChanged({
    required this.aeeCognitiveFunctions,
  });

  final bool aeeCognitiveFunctions;

  @override
  List<Object> get props => [aeeCognitiveFunctions];
}

class AeeMobilityTechniquesChanged extends ClassroomCreateEvent {
  const AeeMobilityTechniquesChanged({
    required this.aeeMobilityTechniques,
  });

  final bool aeeMobilityTechniques;

  @override
  List<Object> get props => [aeeMobilityTechniques];
}

class AeeLibrasChanged extends ClassroomCreateEvent {
  const AeeLibrasChanged({
    required this.aeeLibras,
  });

  final bool aeeLibras;

  @override
  List<Object> get props => [aeeLibras];
}

class AeeCaaChanged extends ClassroomCreateEvent {
  const AeeCaaChanged({
    required this.aeeCaa,
  });

  final bool aeeCaa;

  @override
  List<Object> get props => [aeeCaa];
}

class AeeCurriculumEnrichmentChanged extends ClassroomCreateEvent {
  const AeeCurriculumEnrichmentChanged({
    required this.aeeCurriculumEnrichment,
  });

  final bool aeeCurriculumEnrichment;

  @override
  List<Object> get props => [aeeCurriculumEnrichment];
}

class AeeAccessibleTeachingChanged extends ClassroomCreateEvent {
  const AeeAccessibleTeachingChanged({
    required this.aeeAccessibleTeaching,
  });

  final bool aeeAccessibleTeaching;

  @override
  List<Object> get props => [aeeAccessibleTeaching];
}

class AeePortugueseChanged extends ClassroomCreateEvent {
  const AeePortugueseChanged({
    required this.aeePortuguese,
  });

  final bool aeePortuguese;

  @override
  List<Object> get props => [aeePortuguese];
}

class AeeSorobanChanged extends ClassroomCreateEvent {
  const AeeSorobanChanged({
    required this.aeeSoroban,
  });

  final bool aeeSoroban;

  @override
  List<Object> get props => [aeeSoroban];
}

class AeeAutonomousLifeChanged extends ClassroomCreateEvent {
  const AeeAutonomousLifeChanged({
    required this.aeeAutonomousLife,
  });

  final bool aeeAutonomousLife;

  @override
  List<Object> get props => [aeeAutonomousLife];
}

class MoreEducationParticipatorChanged extends ClassroomCreateEvent {
  const MoreEducationParticipatorChanged({
    required this.moreEducationParticipator,
  });

  final bool moreEducationParticipator;

  @override
  List<Object> get props => [moreEducationParticipator];
}

class AeeChanged extends ClassroomCreateEvent {
  const AeeChanged({required this.aee});

  final bool aee;

  @override
  List<Object> get props => [aee];
}

class ComplementaryActivityChanged extends ClassroomCreateEvent {
  const ComplementaryActivityChanged({required this.complementaryActivity});

  final bool complementaryActivity;

  @override
  List<Object> get props => [complementaryActivity];
}

class SchoolingChanged extends ClassroomCreateEvent {
  const SchoolingChanged({required this.schooling});

  final bool schooling;

  @override
  List<Object> get props => [schooling];
}

class StartTimeChanged extends ClassroomCreateEvent {
  const StartTimeChanged(this.startTime);

  final DateTime startTime;

  @override
  List<Object> get props => [startTime];
}

class EndTimeChanged extends ClassroomCreateEvent {
  const EndTimeChanged(this.endTime);

  final DateTime endTime;

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
