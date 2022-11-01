import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_sdk/tag_sdk.dart';

class MockStudentRemoteDataSource extends Mock
    implements StudentRemoteDataSource {}

void main() {
  group("When listAll", () {
    final datasource = MockStudentRemoteDataSource();
    testWidgets("has right value", (tester) async {
      when(
        () => datasource.listAll(schoolId: "schoolId"),
      ).thenAnswer(
        (invocation) => Future.value([]),
      );

      final repository = StudentRepositoryImpl(datasource);
      final params = await repository.listAll(schoolId: "schoolId");

      expect(params.isRight(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        equals([]),
      );
    });
    testWidgets("has left value", (tester) async {
      when(
        () => datasource.listAll(schoolId: "schoolId"),
      ).thenThrow(
        (invocation) => Exception("Não foi possível listar"),
      );

      final repository = StudentRepositoryImpl(datasource);
      final params = await repository.listAll(schoolId: "schoolId");

      expect(params.isLeft(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<Exception>(),
      );
    });
  });
  group("When getById", () {
    final datasource = MockStudentRemoteDataSource();
    testWidgets("has right value", (tester) async {
      when(
        () => datasource.getById('', schoolId: ''),
      ).thenAnswer((invocation) => Future.value(
            StudentModel(),
          ));

      final repository = StudentRepositoryImpl(datasource);
      final params = await repository.getById('', schoolId: '');

      expect(params.isRight(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<StudentModel>(),
      );
    });
    testWidgets("has left value", (tester) async {
      when(
        () => datasource.getById('', schoolId: ''),
      ).thenThrow(
        (invocation) => Exception("Não foi possível listar"),
      );

      final repository = StudentRepositoryImpl(datasource);
      final params = await repository.getById('', schoolId: '');

      expect(params.isLeft(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<Exception>(),
      );
    });
  });
  group("When create", () {
    final datasource = MockStudentRemoteDataSource();
    testWidgets("has right value", (tester) async {
      when(() => datasource.create(
            StudentModel(),
          )).thenAnswer((invocation) => Future.value(
            StudentModel(),
          ));

      final repository = StudentRepositoryImpl(datasource);
      final params = await repository.create(
        Student(),
      );

      expect(params.isRight(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<StudentModel>(),
      );
    });
    testWidgets("has left value", (tester) async {
      when(() => datasource.create(
            StudentModel(),
          )).thenThrow(
        (invocation) => Exception("Não foi possível adicionar estudante"),
      );

      final repository = StudentRepositoryImpl(datasource);
      final params = await repository.create(
        Student(),
      );

      expect(params.isLeft(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<Exception>(),
      );
    });
  });
  group("When update", () {
    final datasource = MockStudentRemoteDataSource();
    testWidgets("has right value", (tester) async {
      when(() => datasource.update(
            1,
            StudentModel(),
          )).thenAnswer((invocation) => Future.value(
            StudentModel(),
          ));

      final repository = StudentRepositoryImpl(datasource);
      final params = await repository.update(
        1,
        Student(),
      );

      expect(params.isRight(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<StudentModel>(),
      );
    });
    testWidgets("has left value", (tester) async {
      when(() => datasource.update(
            1,
            StudentModel(),
          )).thenThrow(
        (invocation) => Exception("Não foi possível alterar estudante"),
      );

      final repository = StudentRepositoryImpl(datasource);
      final params = await repository.create(
        StudentModel(),
      );

      expect(params.isLeft(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<Exception>(),
      );
    });
  });
  group("When delete", () {
    final datasource = MockStudentRemoteDataSource();
    testWidgets("has right value", (tester) async {
      when(
        () => datasource.delete(""),
      ).thenAnswer(
        (invocation) => Future.value(true),
      );

      final repository = StudentRepositoryImpl(datasource);
      final params = await repository.delete("");

      expect(params.isRight(), isTrue);
      final result = params.fold(id, id);
      expect(result, isTrue);
    });
    testWidgets("has left value", (tester) async {
      when(
        () => datasource.delete(""),
      ).thenThrow(
        (invocation) => Exception("Não foi possível deletar estudante"),
      );

      final repository = StudentRepositoryImpl(datasource);
      final params = await repository.delete("");

      expect(params.isLeft(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<Exception>(),
      );
    });
  });
}
