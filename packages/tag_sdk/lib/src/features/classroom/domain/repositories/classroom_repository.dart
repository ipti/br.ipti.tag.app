import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/api/classroom/get_classroom_endpoint.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/classroom/data/model/list_instructors_teaching_data_params.dart';

import 'package:tag_sdk/src/features/classroom/domain/entities/classroom_create_entity.dart';
import 'package:tag_sdk/src/features/classroom/domain/entities/classroom_entity.dart';

import 'package:tag_sdk/src/features/classroom/domain/entities/instructor_teaching_data_create_entity.dart';
import 'package:tag_sdk/src/features/classroom/domain/entities/instructors_teaching_data_entity.dart';
import 'package:tag_sdk/src/features/classroom/domain/entities/update_instructor_teaching_data_entity.dart';

abstract class ClassroomRepository {
  Future<Either<Failure, bool>> create(ClassroomCreateEntity classroom);
  Future<Either<Failure, bool>> createInstructorTeachingData(
    InstructorTeachingDataCreateEntity instructor,
  );
  Future<Either<Failure, List<ClassroomEntity>>> listAll(
      ClassroomParams params);
  Future<Either<Failure, bool>> update({
    required int id,
    required ClassroomCreateEntity classroomCreateEntity,
  });
  Future<Either<Failure, bool>> updateInstructorTeachingData({
    required int id,
    required InstructorTeachingDataUpdateEntity instructor,
  });
  Future<Either<Failure, bool>> delete({
    required int id,
  });

  Future<Either<Failure, List<InstructorTeachingDataEntity>>>
      listInstructorsTeachingData({
    required ListInstructorsTeachingDataParams param,
  });
}
