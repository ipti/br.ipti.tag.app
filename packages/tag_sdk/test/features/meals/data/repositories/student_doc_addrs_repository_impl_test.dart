import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/tag_sdk.dart';

class MockStudentDocumentsAndAddressRemoteDataSource extends Mock
    implements StudentDocumentsAndAddressRemoteDataSource {}

void main() {
  group("When  ", () {
    final studentDocsAddressModel = StudentDocsAndAddress(
      schoolIdentification: "schoolInepIdFk",
      studentFk: 1,
      rgNumber: "rgNumber",
      edcensoUfFk: 1,
      edcensoCityFk: 1,
    );
    testWidgets("getByStudentId has right value", (tester) async {
      final datasource = MockStudentDocumentsAndAddressRemoteDataSource();
      when(
        () => datasource.getByStudentId(1),
      ).thenAnswer(
        (invocation) => Future.value(studentDocsAddressModel),
      );

      final repository = StudentDocumentsAddressRepositoryImpl(datasource);
      final params = await repository.getByStudentId(1);

      expect(params.isRight(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<StudentDocsAndAddress>(),
      );
    });
    testWidgets("getByStudentId has left value", (tester) async {
      final datasource = MockStudentDocumentsAndAddressRemoteDataSource();
      when(
        () => datasource.getByStudentId(1),
      ).thenThrow(
        (invocation) => Failure("Não foi possível listar"),
      );

      final repository = StudentDocumentsAddressRepositoryImpl(datasource);
      final params = await repository.getByStudentId(1);

      expect(params.isLeft(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<Exception>(),
      );
    });
    testWidgets("create has right value", (tester) async {
      final datasource = MockStudentDocumentsAndAddressRemoteDataSource();
      when(
        () => datasource.create(studentDocsAddressModel),
      ).thenAnswer(
        (invocation) => Future.value(studentDocsAddressModel),
      );

      final repository = StudentDocumentsAddressRepositoryImpl(datasource);
      final params = await repository.create(studentDocsAddressModel);
      expect(params.isRight(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<StudentDocsAndAddress>(),
      );
    });
    testWidgets("create has left value", (tester) async {
      final datasource = MockStudentDocumentsAndAddressRemoteDataSource();
      when(
        () => datasource.create(studentDocsAddressModel),
      ).thenThrow(
        (invocation) => Failure("Não foi possível adicionar estudante"),
      );

      final repository = StudentDocumentsAddressRepositoryImpl(datasource);
      final params = await repository.create(studentDocsAddressModel);

      expect(params.isLeft(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<Exception>(),
      );
    });
    testWidgets("update has right value", (tester) async {
      final datasource = MockStudentDocumentsAndAddressRemoteDataSource();
      when(
        () => datasource.update(1, studentDocsAddressModel),
      ).thenAnswer(
        (invocation) => Future.value(studentDocsAddressModel),
      );

      final repository = StudentDocumentsAddressRepositoryImpl(datasource);
      final params = await repository.update(1, studentDocsAddressModel);
      expect(params.isRight(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<StudentDocsAndAddress>(),
      );
    });
    testWidgets("alterar has left value", (tester) async {
      final datasource = MockStudentDocumentsAndAddressRemoteDataSource();
      when(
        () => datasource.update(1, studentDocsAddressModel),
      ).thenThrow(
        (invocation) => Failure("Não foi possível alterar estudante"),
      );

      final repository = StudentDocumentsAddressRepositoryImpl(datasource);
      final params = await repository.update(1, studentDocsAddressModel);

      expect(params.isLeft(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<Exception>(),
      );
    });
  });
}
