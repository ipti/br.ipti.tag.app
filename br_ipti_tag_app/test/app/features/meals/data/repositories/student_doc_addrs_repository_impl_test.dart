import 'package:br_ipti_tag_app/app/features/student/data/datasources/remote/student_doc_address_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/student/data/models/student_docs_model.dart';
import 'package:br_ipti_tag_app/app/features/student/data/repositories/student_docs_addrs_repository_impl.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student_documents.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStudentDocumentsAndAddressRemoteDataSource extends Mock
    implements StudentDocumentsAndAddressRemoteDataSource {}

void main() {
  group("When  ", () {
    final studentDocsAddressModel = StudentDocumentsAddressModel(
        schoolInepIdFk: "schoolInepIdFk",
        studentFk: 1,
        rgNumber: "rgNumber",
        edcensoUfFk: "edcensoUfFk",
        edcensoCityFk: "edcensoCityFk");
    testWidgets("getByStudentId has right value", (tester) async {
      final datasource = MockStudentDocumentsAndAddressRemoteDataSource();
      when(() => datasource.getByStudentId(1))
          .thenAnswer((invocation) => Future.value(studentDocsAddressModel));

      final repository = StudentDocumentsAddressRepositoryImpl(datasource);
      final params = await repository.getByStudentId(1);

      expect(params.isRight(), isTrue);
      final result = params.fold(id, id);
      expect(result, isA<StudentDocsAddress>());
    });
    testWidgets("getByStudentId has left value", (tester) async {
      final datasource = MockStudentDocumentsAndAddressRemoteDataSource();
      when(() => datasource.getByStudentId(1))
          .thenThrow((invocation) => Exception("Não foi possível listar"));

      final repository = StudentDocumentsAddressRepositoryImpl(datasource);
      final params = await repository.getByStudentId(1);

      expect(params.isLeft(), isTrue);
      final result = params.fold(id, id);
      expect(result, isA<Exception>());
    });
    testWidgets("create has right value", (tester) async {
      final datasource = MockStudentDocumentsAndAddressRemoteDataSource();
      when(() => datasource.create(studentDocsAddressModel))
          .thenAnswer((invocation) => Future.value(studentDocsAddressModel));

      final repository = StudentDocumentsAddressRepositoryImpl(datasource);
      final params = await repository.create(studentDocsAddressModel);
      expect(params.isRight(), isTrue);
      final result = params.fold(id, id);
      expect(result, isA<StudentDocsAddress>());
    });
    testWidgets("create has left value", (tester) async {
      final datasource = MockStudentDocumentsAndAddressRemoteDataSource();
      when(() => datasource.create(studentDocsAddressModel)).thenThrow(
          (invocation) => Exception("Não foi possível adicionar estudante"));

      final repository = StudentDocumentsAddressRepositoryImpl(datasource);
      final params = await repository.create(studentDocsAddressModel);

      expect(params.isLeft(), isTrue);
      final result = params.fold(id, id);
      expect(result, isA<Exception>());
    });
    testWidgets("update has right value", (tester) async {
      final datasource = MockStudentDocumentsAndAddressRemoteDataSource();
      when(() => datasource.update("", studentDocsAddressModel))
          .thenAnswer((invocation) => Future.value(studentDocsAddressModel));

      final repository = StudentDocumentsAddressRepositoryImpl(datasource);
      final params = await repository.update("", studentDocsAddressModel);
      expect(params.isRight(), isTrue);
      final result = params.fold(id, id);
      expect(result, isA<StudentDocsAddress>());
    });
    testWidgets("alterar has left value", (tester) async {
      final datasource = MockStudentDocumentsAndAddressRemoteDataSource();
      when(() => datasource.update("", studentDocsAddressModel)).thenThrow(
          (invocation) => Exception("Não foi possível alterar estudante"));

      final repository = StudentDocumentsAddressRepositoryImpl(datasource);
      final params = await repository.update("", studentDocsAddressModel);

      expect(params.isLeft(), isTrue);
      final result = params.fold(id, id);
      expect(result, isA<Exception>());
    });
  });
}