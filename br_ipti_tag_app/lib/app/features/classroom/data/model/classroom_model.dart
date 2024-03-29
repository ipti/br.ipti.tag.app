import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_entity.dart';

class ClassroomModel extends ClassroomEntity {
  ClassroomModel({
    required String edcensoStageVsModalityFk,
    required String name,
    required String startTime,
    required String endTime,
    required int? modalityId,
    required int typePedagogicMeditationId,
    required String stage,
    required String id,
    bool schooling = false,
    bool complementaryActivity = false,
    bool aee = false,
    bool moreEducationParticipator = false,
    bool aeeBraille = false,
    bool aeeOpticalNonoptical = false,
    bool aeeCognitiveFunction = false,
    bool aeeMobilityTechniques = false,
    bool aeeLibras = false,
    bool aeeCaa = false,
    bool aeeCurriculumEnrichment = false,
    bool aeeSoroban = false,
    bool aeeAccessibleTeaching = false,
    bool aeePortuguese = false,
    bool aeeAutonomousLife = false,
  }) : super(
          name: name,
          stage: stage,
          modalityId: modalityId,
          endTime: endTime,
          typePedagogicMediationId: typePedagogicMeditationId,
          startTime: startTime,
          id: id,
          edcensoStageVsModalityFk: edcensoStageVsModalityFk,
          schooling: schooling,
          aee: aee,
          aeeAccessibleTeaching: aeeAccessibleTeaching,
          aeeAutonomousLife: aeeAutonomousLife,
          aeeBraille: aeeBraille,
          aeeCaa: aeeCaa,
          aeeCognitiveFunctions: aeeCognitiveFunction,
          aeeCurriculumEnrichment: aeeCurriculumEnrichment,
          aeeLibras: aeeLibras,
          aeeMobilityTechniques: aeeMobilityTechniques,
          aeeOpticalNonOptical: aeeOpticalNonoptical,
          aeePortuguese: aeePortuguese,
          aeeSoroban: aeeSoroban,
          complementaryActivity: complementaryActivity,
          moreEducationParticipator: moreEducationParticipator,
        );

  factory ClassroomModel.fromJson(Map<String, dynamic> map) {
    return ClassroomModel(
      name: map['name'],
      id: map['_id'],
      startTime: '${map['initial_hour']}:${map['initial_minute']}',
      endTime: '${map['final_hour']}:${map['final_minute']}',
      modalityId: map['modality'],
      typePedagogicMeditationId: map['pedagogical_mediation_type'],
      stage: map['edcenso_stage_vs_modality_fk'],
      edcensoStageVsModalityFk: map['edcenso_stage_vs_modality_fk'],
      schooling: map['schooling'] ?? false,
      aee: map['aee'] ?? false,
      aeeAccessibleTeaching: map['aee_accessible_teaching'] ?? false,
      aeeAutonomousLife: map['aee_autonomous_life'] ?? false,
      aeeBraille: map['aee_braille'] ?? false,
      aeeCaa: map['aee_caa'] ?? false,
      aeeCognitiveFunction: map['aee_cognitive_functions'] ?? false,
      aeeCurriculumEnrichment: map['aee_curriculum_enrichment'] ?? false,
      aeeLibras: map['aee_libras'] ?? false,
      aeeMobilityTechniques: map['aee_mobility_techniques'] ?? false,
      aeeOpticalNonoptical: map['aee_optical_nonoptical'] ?? false,
      aeePortuguese: map['aee_portuguese'] ?? false,
      aeeSoroban: map['aee_soroban'] ?? false,
      complementaryActivity: map['complementary_activity'] ?? false,
      moreEducationParticipator: map['mais_educacao_participator'] ?? false,
    );
  }
}
