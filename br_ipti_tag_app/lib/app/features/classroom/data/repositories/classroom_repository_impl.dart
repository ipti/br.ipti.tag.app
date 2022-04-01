import 'package:br_ipti_tag_app/app/core/network/interceptors/error_interceptor.dart';
import 'package:br_ipti_tag_app/app/features/classroom/data/datasource/classroom_datasource.dart';
import 'package:br_ipti_tag_app/app/features/classroom/data/model/instructor_teaching_data_create_model.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_create_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/edcenso_disciplines_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructor_teaching_data_create_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructors_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructors_teaching_data_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/update_instructor_teaching_data_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/repositories/classroom_repository.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_instructors_teaching_data_usecase.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_instructors_usecase.dart';
import 'package:dartz/dartz.dart';

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
    } on RestClientException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, List<ClassroomEntity>>> list() async {
    try {
      final result = await classroomRemoteDataSource.listAll();
      return Right(result);
    } on RestClientException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, bool>> delete({required String id}) async {
    try {
      final result = await classroomRemoteDataSource.delete(id);
      return Right(result);
    } on RestClientException catch (e) {
      return Left(e);
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
    } on RestClientException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, List<EdcensoDisciplinesEntity>>>
      listEdcensoDisciplines() async {
    try {
      final result = await classroomRemoteDataSource.listEdcensoDisciplines();
      return Right(result);
    } on RestClientException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, List<InstructorEntity>>> listInstructors(
      {required ListInstructorsParams param}) async {
    try {
      final result = await classroomRemoteDataSource.listInstructors(param);
      return Right(result);
    } on RestClientException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, List<InstructorTeachingDataEntity>>>
      listInstructorsTeachingData(
          {required ListInstructorsTeachingDataParams param}) async {
    try {
      final result =
          await classroomRemoteDataSource.listInstructorsTeachingData(param);
      return Right(result);
    } on RestClientException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, bool>> createInstructorTeachingData(
      InstructorTeachingDataCreateEntity instructor) async {
    try {
      final result = await classroomRemoteDataSource
          .createInstructorsTeachingData(instructor.fromEntity());
      return Right(result);
    } on RestClientException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, bool>> updateInstructorTeachingData(
      {required String id,
      required InstructorTeachingDataUpdateEntity instructor}) async {
    try {
      final result = await classroomRemoteDataSource
          .updateInstructorsTeachingData(id, instructor.fromEntity());
      return Right(result);
    } on RestClientException catch (e) {
      return Left(e);
    }
  }
}
