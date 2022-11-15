import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/api/classroom/get_classroom_endpoint.dart';
import 'package:tag_sdk/src/features/classroom/data/datasource/classroom_datasource.dart';
import 'package:tag_sdk/src/features/classroom/domain/entities/classroom_create_entity.dart';
import 'package:tag_sdk/src/features/classroom/domain/entities/classroom_entity.dart';
import 'package:tag_sdk/src/features/classroom/domain/entities/instructor_teaching_data_create_entity.dart';
import 'package:tag_sdk/src/features/classroom/domain/entities/instructors_teaching_data_entity.dart';
import 'package:tag_sdk/src/features/classroom/domain/entities/update_instructor_teaching_data_entity.dart';
import 'package:tag_sdk/src/features/classroom/domain/repositories/classroom_repository.dart';
import 'package:tag_sdk/src/features/classroom/domain/usecases/list_instructors_teaching_data_usecase.dart';

class ClassroomRepositoryImpl extends ClassroomRepository {
  final ClassroomRemoteDataSource classroomRemoteDataSource;

  ClassroomRepositoryImpl({required this.classroomRemoteDataSource});

  @override
  Future<Either<Exception, bool>> create(
    ClassroomCreateEntity classroom,
  ) async {
    try {
      final result = await classroomRemoteDataSource.create(
        classroom.fromEntity(),
      );

      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<ClassroomEntity>>> listAll(
    ClassroomParams params,
  ) async {
    try {
      final result = await classroomRemoteDataSource.listAll(params);

      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, bool>> delete({required String id}) async {
    try {
      final result = await classroomRemoteDataSource.delete(id);

      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, bool>> update({
    required String id,
    required ClassroomCreateEntity classroomCreateEntity,
  }) async {
    try {
      final result = await classroomRemoteDataSource.update(
        classroomCreateEntity.fromEntity(),
        id,
      );

      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<InstructorTeachingDataEntity>>>
      listInstructorsTeachingData({
    required ListInstructorsTeachingDataParams param,
  }) async {
    try {
      final result =
          await classroomRemoteDataSource.listInstructorsTeachingData(param);

      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, bool>> createInstructorTeachingData(
    InstructorTeachingDataCreateEntity instructor,
  ) async {
    try {
      final result =
          await classroomRemoteDataSource.createInstructorsTeachingData(
        instructor.fromEntity(),
      );

      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, bool>> updateInstructorTeachingData({
    required String id,
    required InstructorTeachingDataUpdateEntity instructor,
  }) async {
    try {
      final result =
          await classroomRemoteDataSource.updateInstructorsTeachingData(
        id,
        instructor.fromEntity(),
      );

      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
