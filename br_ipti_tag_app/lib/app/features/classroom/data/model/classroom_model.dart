import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom.dart';

class ClassroomModel extends ClassroomEntity {
  ClassroomModel({
    required String name,
    required String startTime,
    required String endTime,
    required int? modalityId,
    required int typePedagogicMeditationId,
    required String stage,
  }) : super(
          name: name,
          stage: stage,
          modalityId: modalityId,
          endTime: endTime,
          typePedagogicMediationId: typePedagogicMeditationId,
          startTime: startTime,
        );

  factory ClassroomModel.fromJson(Map<String, dynamic> map) {
    return ClassroomModel(
      name: map['name'],
      startTime: '${map['initial_hour']}:${map['initial_minute']}',
      endTime: '${map['final_hour']}:${map['final_minute']}',
      modalityId: map['modality'],
      typePedagogicMeditationId: map['pedagogical_mediation_type'],
      stage: map['edcenso_stage_vs_modality_fk'],
    );
  }
}
