import 'package:br_ipti_tag_app/app/features/student/data/datasources/remote/student_enrollment_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/student/data/models/student_enrollment_model.dart';
import 'package:br_ipti_tag_app/app/features/student/data/repositories/student_enrollment_repository_impl.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/enrollment.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStudentEnrollmenrRemoteDataSource extends Mock
    implements StudentEnrollmenrRemoteDataSource {}

void main() {
  group("When getById", () {
    final studentEnrollmentModel = StudentEnrollmentModel(
        schoolInepIdFk: "schoolInepIdFk",
        studentFk: 1,
        classroomFk: "classroomFk");
    final datasource = MockStudentEnrollmenrRemoteDataSource();
    testWidgets("has right value", (tester) async {
      when(() => datasource.getById(1))
          .thenAnswer((invocation) => Future.value(studentEnrollmentModel));

      final repository = StudentEnrollmentRepositoryImpl(datasource);
      final params = await repository.getById(1);

      expect(params.isRight(), isTrue);
      final result = params.fold(id, id);
      expect(result, isA<StudentEnrollment>());
    });
    testWidgets("has left value", (tester) async {
      when(() => datasource.getById(1))
          .thenThrow((invocation) => Exception("Não foi possível listar"));

      final repository = StudentEnrollmentRepositoryImpl(datasource);
      final params = await repository.getById(1);

      expect(params.isLeft(), isTrue);
      final result = params.fold(id, id);
      expect(result, isA<Exception>());
    });
  });
  group("When getStudentById", () {
    final studentEnrollmentModel = StudentEnrollmentModel(
        schoolInepIdFk: "schoolInepIdFk",
        studentFk: 1,
        classroomFk: "classroomFk");
    final datasource = MockStudentEnrollmenrRemoteDataSource();
    testWidgets("has right value", (tester) async {
      when(() => datasource.getByStudentId(1))
          .thenAnswer((invocation) => Future.value(studentEnrollmentModel));

      final repository = StudentEnrollmentRepositoryImpl(datasource);
      final params = await repository.getStudentById(1);

      expect(params.isRight(), isTrue);
      final result = params.fold(id, id);
      expect(result, isA<StudentEnrollment>());
    });
    testWidgets("has left value", (tester) async {
      when(() => datasource.getByStudentId(1))
          .thenThrow((invocation) => Exception("Não foi possível listar"));

      final repository = StudentEnrollmentRepositoryImpl(datasource);
      final params = await repository.getStudentById(1);

      expect(params.isLeft(), isTrue);
      final result = params.fold(id, id);
      expect(result, isA<Exception>());
    });
  });
  group("When create", () {
    final studentEnrollmentModel = StudentEnrollmentModel(
        schoolInepIdFk: "schoolInepIdFk",
        studentFk: 1,
        classroomFk: "classroomFk");
    final datasource = MockStudentEnrollmenrRemoteDataSource();
    testWidgets("has right value", (tester) async {
      when(() => datasource.create(studentEnrollmentModel))
          .thenAnswer((invocation) => Future.value(studentEnrollmentModel));

      final repository = StudentEnrollmentRepositoryImpl(datasource);
      final params = await repository.create(studentEnrollmentModel);

      expect(params.isRight(), isTrue);
      final result = params.fold(id, id);
      expect(result, isA<StudentEnrollment>());
    });
    testWidgets("has left value", (tester) async {
      when(() => datasource.create(studentEnrollmentModel))
          .thenThrow((invocation) => Exception("Não foi possível listar"));

      final repository = StudentEnrollmentRepositoryImpl(datasource);
      final params = await repository.create(studentEnrollmentModel);

      expect(params.isLeft(), isTrue);
      final result = params.fold(id, id);
      expect(result, isA<Exception>());
    });
  });
  group("When update", () {
    final studentEnrollmentModel = StudentEnrollmentModel(
        schoolInepIdFk: "schoolInepIdFk",
        studentFk: 1,
        classroomFk: "classroomFk");
    final datasource = MockStudentEnrollmenrRemoteDataSource();
    testWidgets("has right value", (tester) async {
      when(() => datasource.update('', studentEnrollmentModel))
          .thenAnswer((invocation) => Future.value(studentEnrollmentModel));

      final repository = StudentEnrollmentRepositoryImpl(datasource);
      final params = await repository.update('', studentEnrollmentModel);

      expect(params.isRight(), isTrue);
      final result = params.fold(id, id);
      expect(result, isA<StudentEnrollment>());
    });
    testWidgets("has left value", (tester) async {
      when(() => datasource.update('', studentEnrollmentModel))
          .thenThrow((invocation) => Exception("Não foi possível listar"));

      final repository = StudentEnrollmentRepositoryImpl(datasource);
      final params = await repository.update('', studentEnrollmentModel);

      expect(params.isLeft(), isTrue);
      final result = params.fold(id, id);
      expect(result, isA<Exception>());
    });
  });
}
