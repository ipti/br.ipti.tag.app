import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/tag_sdk.dart';

class MockStudentEnrollmenrRemoteDataSource extends Mock
    implements StudentEnrollmenrRemoteDataSource {}

void main() {
  group("When getById", () {
    final studentEnrollmentModel = StudentEnrollmentModel(
      schoolInepIdFk: "1",
      studentFk: 1,
      classroomFk: 1,
    );
    final datasource = MockStudentEnrollmenrRemoteDataSource();
    testWidgets("has right value", (tester) async {
      when(
        () => datasource.getById(1),
      ).thenAnswer(
        (invocation) => Future.value(studentEnrollmentModel),
      );

      final repository = StudentEnrollmentRepositoryImpl(datasource);
      final params = await repository.getById(1);

      expect(params.isRight(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<StudentEnrollment>(),
      );
    });
    testWidgets("has left value", (tester) async {
      when(
        () => datasource.getById(1),
      ).thenThrow(
        (invocation) => Failure("Não foi possível listar"),
      );

      final repository = StudentEnrollmentRepositoryImpl(datasource);
      final params = await repository.getById(1);

      expect(params.isLeft(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<Exception>(),
      );
    });
  });
  group("When getStudentById", () {
    final studentEnrollmentModel = StudentEnrollmentModel(
      schoolInepIdFk: "1",
      studentFk: 1,
      classroomFk: 1,
    );
    final datasource = MockStudentEnrollmenrRemoteDataSource();
    testWidgets("has right value", (tester) async {
      when(
        () => datasource.getByStudentId(1),
      ).thenAnswer(
        (invocation) => Future.value(studentEnrollmentModel),
      );

      final repository = StudentEnrollmentRepositoryImpl(datasource);
      final params = await repository.getStudentById(1);

      expect(params.isRight(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<StudentEnrollment>(),
      );
    });
    testWidgets("has left value", (tester) async {
      when(
        () => datasource.getByStudentId(1),
      ).thenThrow(
        (invocation) => Failure("Não foi possível listar"),
      );

      final repository = StudentEnrollmentRepositoryImpl(datasource);
      final params = await repository.getStudentById(1);

      expect(params.isLeft(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<Exception>(),
      );
    });
  });
  group("When create", () {
    final studentEnrollmentModel = StudentEnrollmentModel(
      schoolInepIdFk: "1",
      studentFk: 1,
      classroomFk: 1,
    );
    final datasource = MockStudentEnrollmenrRemoteDataSource();
    testWidgets("has right value", (tester) async {
      when(
        () => datasource.create(studentEnrollmentModel),
      ).thenAnswer(
        (invocation) => Future.value(studentEnrollmentModel),
      );

      final repository = StudentEnrollmentRepositoryImpl(datasource);
      final params = await repository.create(studentEnrollmentModel);

      expect(params.isRight(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<StudentEnrollment>(),
      );
    });
    testWidgets("has left value", (tester) async {
      when(
        () => datasource.create(studentEnrollmentModel),
      ).thenThrow(
        (invocation) => Failure("Não foi possível listar"),
      );

      final repository = StudentEnrollmentRepositoryImpl(datasource);
      final params = await repository.create(studentEnrollmentModel);

      expect(params.isLeft(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<Exception>(),
      );
    });
  });
  group("When update", () {
    final studentEnrollmentModel = StudentEnrollmentModel(
      schoolInepIdFk: "1",
      studentFk: 1,
      classroomFk: 1,
    );
    final datasource = MockStudentEnrollmenrRemoteDataSource();
    testWidgets("has right value", (tester) async {
      when(
        () => datasource.update(1, studentEnrollmentModel),
      ).thenAnswer(
        (invocation) => Future.value(studentEnrollmentModel),
      );

      final repository = StudentEnrollmentRepositoryImpl(datasource);
      final params = await repository.update(1, studentEnrollmentModel);

      expect(params.isRight(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<StudentEnrollment>(),
      );
    });
    testWidgets("has left value", (tester) async {
      when(
        () => datasource.update(1, studentEnrollmentModel),
      ).thenThrow(
        (invocation) => Failure("Não foi possível listar"),
      );

      final repository = StudentEnrollmentRepositoryImpl(datasource);
      final params = await repository.update(1, studentEnrollmentModel);

      expect(params.isLeft(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<Exception>(),
      );
    });
  });
}
