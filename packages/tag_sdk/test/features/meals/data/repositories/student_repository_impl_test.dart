import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
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
        (invocation) => Failure("Não foi possível listar"),
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
        () => datasource.getById(0, schoolId: ''),
      ).thenAnswer(
        (invocation) => Future.value(
          StudentIdentification(
            registerType: "00",
            schoolInepIdFk: "21212121",
            name: "Aluno",
            birthday: "2002-02-02",
            sex: 1,
            colorRace: 1,
            filiation: 1,
          ),
        ),
      );

      final repository = StudentRepositoryImpl(datasource);
      final params = await repository.getById(0, schoolId: '');

      expect(params.isRight(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<StudentIdentification>(),
      );
    });
    testWidgets("has left value", (tester) async {
      when(
        () => datasource.getById(0, schoolId: ''),
      ).thenThrow(
        (invocation) => Failure("Não foi possível listar"),
      );

      final repository = StudentRepositoryImpl(datasource);
      final params = await repository.getById(0, schoolId: '');

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
            StudentIdentification(
              registerType: "00",
              schoolInepIdFk: "21212121",
              name: "Aluno",
              birthday: "2002-02-02",
              sex: 1,
              colorRace: 1,
              filiation: 1,
            ),
          )).thenAnswer((invocation) => Future.value(
            StudentIdentification(
              registerType: "00",
              schoolInepIdFk: "21212121",
              name: "Aluno",
              birthday: "2002-02-02",
              sex: 1,
              colorRace: 1,
              filiation: 1,
            ),
          ));

      final repository = StudentRepositoryImpl(datasource);
      final params = await repository.create(
        StudentIdentification(
          registerType: "00",
          schoolInepIdFk: "21212121",
          name: "Aluno",
          birthday: "2002-02-02",
          sex: 1,
          colorRace: 1,
          filiation: 1,
        ),
      );

      expect(params.isRight(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<StudentIdentification>(),
      );
    });
    testWidgets("has left value", (tester) async {
      when(() => datasource.create(
            StudentIdentification(
              registerType: "00",
              schoolInepIdFk: "21212121",
              name: "Aluno",
              birthday: "2002-02-02",
              sex: 1,
              colorRace: 1,
              filiation: 1,
            ),
          )).thenThrow(
        (invocation) => Failure("Não foi possível adicionar estudante"),
      );

      final repository = StudentRepositoryImpl(datasource);
      final params = await repository.create(
        StudentIdentification(
          registerType: "00",
          schoolInepIdFk: "21212121",
          name: "Aluno",
          birthday: "2002-02-02",
          sex: 1,
          colorRace: 1,
          filiation: 1,
        ),
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
            StudentIdentification(
              registerType: "00",
              schoolInepIdFk: "21212121",
              name: "Aluno",
              birthday: "2002-02-02",
              sex: 1,
              colorRace: 1,
              filiation: 1,
            ),
          )).thenAnswer((invocation) => Future.value(
            StudentIdentification(
              registerType: "00",
              schoolInepIdFk: "21212121",
              name: "Aluno",
              birthday: "2002-02-02",
              sex: 1,
              colorRace: 1,
              filiation: 1,
            ),
          ));

      final repository = StudentRepositoryImpl(datasource);
      final params = await repository.update(
        1,
        StudentIdentification(
          registerType: "00",
          schoolInepIdFk: "21212121",
          name: "Aluno",
          birthday: "2002-02-02",
          sex: 1,
          colorRace: 1,
          filiation: 1,
        ),
      );

      expect(params.isRight(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<StudentIdentification>(),
      );
    });
    testWidgets("has left value", (tester) async {
      when(() => datasource.update(
            1,
            StudentIdentification(
              registerType: "00",
              schoolInepIdFk: "21212121",
              name: "Aluno",
              birthday: "2002-02-02",
              sex: 1,
              colorRace: 1,
              filiation: 1,
            ),
          )).thenThrow(
        (invocation) => Failure("Não foi possível alterar estudante"),
      );

      final repository = StudentRepositoryImpl(datasource);
      final params = await repository.create(
        StudentIdentification(
          registerType: "00",
          schoolInepIdFk: "21212121",
          name: "Aluno",
          birthday: "2002-02-02",
          sex: 1,
          colorRace: 1,
          filiation: 1,
        ),
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
        () => datasource.delete(0),
      ).thenAnswer(
        (invocation) => Future.value(true),
      );

      final repository = StudentRepositoryImpl(datasource);
      final params = await repository.delete(0);

      expect(params.isRight(), isTrue);
      final result = params.fold(id, id);
      expect(result, isTrue);
    });
    testWidgets("has left value", (tester) async {
      when(
        () => datasource.delete(0),
      ).thenThrow(
        (invocation) => Failure("Não foi possível deletar estudante"),
      );

      final repository = StudentRepositoryImpl(datasource);
      final params = await repository.delete(0);

      expect(params.isLeft(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<Exception>(),
      );
    });
  });
}
