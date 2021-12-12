import 'package:br_ipti_tag_app/app/api/classroom/post_classroom_endpoint.dart';
import 'package:br_ipti_tag_app/app/core/network/interceptors/error_interceptor.dart';
import 'package:br_ipti_tag_app/app/features/classroom/data/datasource/classroom_datasource.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_create.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/repositories/classroom_repository.dart';
import 'package:dartz/dartz.dart';

class ClassroomRepositoryImpl extends ClassroomRepository {
  final ClassroomRemoteDataSource classroomRemoteDataSource;

  ClassroomRepositoryImpl({required this.classroomRemoteDataSource});

  @override
  Future<Either<Exception, bool>> create(ClassroomCreate classroom) async {
    try {
      final result = await classroomRemoteDataSource.create(
        PostClassroomParams(
          disciplineForeignLanguageEnglish: false,
          edcensoStageVsModalityFk: '',
          initialHour: classroom.startTime.hour.toString(),
          initialMinute: classroom.startTime.minute.toString(),
          finalHour: classroom.endTime.hour.toString(),
          finalMinute: classroom.endTime.minute.toString(),
          weekDaySunday: classroom.weekDaysSunday,
          weekDayMonday: classroom.weekDaysMonday,
          weekDayTuesday: classroom.weekDaysTuesday,
          weekDayWednesday: classroom.weekDaysWednesday,
          weekDayThursday: classroom.weekDaysThursday,
          weekDayFriday: classroom.weekDaysFriday,
          weekDaySaturday: classroom.weekDaysSaturday,
          registerType: classroom.registerType,
          inepId: '',
          name: classroom.name,
          course: 0,
          pedagogicalMeditationType: 0,
          schooling: classroom.schooling,
          complementaryActivity: classroom.complementaryActivity,
          aee: classroom.aee,
          assistanceType: 0,
          maisEducacaoParticipator: false,
          complementaryActivityType1: 0,
          complementaryActivityType2: 0,
          complementaryActivityType3: 0,
          complementaryActivityType4: 0,
          complementaryActivityType5: 0,
          complementaryActivityType6: 0,
          diffLocation: 0,
          aeeBraille: classroom.aeeBraille,
          aeeOpticalNonoptical: classroom.aeeOpticalNonOptical,
          aeeCognitiveFunction: classroom.aeeCognitiveFunctions,
          aeeMobilityTechniques: classroom.aeeMobilityTechniques,
          aeeLibras: classroom.aeeLibras,
          aeeCaa: classroom.aeeCaa,
          aeeCurriculumEnrichment: classroom.aeeCurriculumEnrichment,
          aeeSoroban: classroom.aeeSoroban,
          aeeAccessibleTeaching: classroom.aeeAccessibleTeaching,
          aeePortuguese: classroom.aeePortuguese,
          aeeAutonomousLife: classroom.aeeAutonomousLife,
          modality: classroom.modalityId,
          disciplineChemistry: false,
          disciplinePhysics: false,
          disciplineMathematics: false,
          disciplineBiology: false,
          disciplineScience: false,
          disciplineLanguagePortugueseLiterature: false,
          disciplineForeignLanguageSpanish: false,
          disciplineForeignLanguageFranch: false,
          disciplineForeignLanguageOther: false,
          disciplineArts: false,
          disciplinePhysicalEducation: false,
          disciplineHistory: false,
          disciplineGeography: false,
          disciplinePhilosophy: false,
          disciplineSocialStudy: false,
          disciplineSociology: false,
          disciplinePortugueseSecondaryLanguage: false,
          disciplineCurricularStage: false,
          disciplineInformatics: false,
          disciplineProfessionalDisciplines: false,
          disciplineSpecialEducationAndInclusivePractives: false,
          disciplineSocioculturalDiversity: false,
          disciplineLibras: false,
          disciplinePedagogical: false,
          disciplineReligious: false,
          disciplineNativeLanguage: false,
          disciplineOthers: false,
          schoolYear: classroom.schoolYear ?? 0,
          turn: '',
          hash: 0,
        ),
      );
      return Right(result);
    } on RestClientException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, List<Classroom>>> list() async {
    return Right(<Classroom>[
      Classroom(
          name: "1º ano Ensino Fundamental",
          endTime: null,
          startTime: null,
          modalityId: 0,
          stageId: 0,
          typePedagogicMediationId: 0),
      Classroom(
          name: "3º ano Ensino Fundamental",
          endTime: null,
          startTime: null,
          modalityId: 0,
          stageId: 0,
          typePedagogicMediationId: 0),
      Classroom(
          name: "4º ano Ensino Fundamental",
          endTime: null,
          startTime: null,
          modalityId: 0,
          stageId: 0,
          typePedagogicMediationId: 0),
    ]);
  }
}
