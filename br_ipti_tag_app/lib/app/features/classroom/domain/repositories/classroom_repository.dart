import 'package:br_ipti_tag_app/app/features/classroom/data/model/instructor_teaching_data_create_model.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_create_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/edcenso_disciplines_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructor_teaching_data_create_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructors_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructors_teaching_data_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_instructors_teaching_data_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_instructors_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class ClassroomRepository {
  Future<Either<Exception, bool>> create(ClassroomCreateEntity classroom);
  Future<Either<Exception, bool>> createInstructorTeachingData(
      InstructorTeachingDataCreateEntity instructor);
  Future<Either<Exception, List<ClassroomEntity>>> list();
  Future<Either<Exception, bool>> update({
    required String id,
    required ClassroomCreateEntity classroomCreateEntity,
  });
  Future<Either<Exception, bool>> updateInstructorTeachingData({
    required String id,
    required InstructorTeachingDataCreateEntity instructor,
  });
  Future<Either<Exception, bool>> delete({
    required String id,
  });
  Future<Either<Exception, List<InstructorEntity>>> listInstructors({
    required ListInstructorsParams param,
  });
  Future<Either<Exception, List<InstructorTeachingDataEntity>>>
      listInstructorsTeachingData({
    required ListInstructorsTeachingDataParams param,
  });
  Future<Either<Exception, List<EdcensoDisciplinesEntity>>>
      listEdcensoDisciplines();
}
