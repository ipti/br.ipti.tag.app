import 'dart:io';

import 'package:br_ipti_tag_app/app/features/student/domain/entities/student_documents.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_doc_address_repositories.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/update_address_documents_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStudentDocumentsAddressRepository extends Mock
    implements StudentDocumentsAddressRepository {}

void main() {
  testWidgets("UpdateDocumentsAndAddressUsecase when update a right value",
      (tester) async {
    final studentDocsAddress = StudentDocsAddress(
        schoolInepIdFk: "schoolInepIdFk",
        studentFk: "studentFk",
        rgNumber: "rgNumber",
        edcensoUfFk: "edcensoUfFk",
        edcensoCityFk: "edcensoCityFk");
    final repository = MockStudentDocumentsAddressRepository();
    when(() => repository.update('', studentDocsAddress))
        .thenAnswer((invocation) => Future.value(right(studentDocsAddress)));

    final usercase = UpdateDocumentsAndAddressUsecase(repository);
    final params = UpdateDocumentsAndAddressParams(
        studentDocsId: '', studentDocumentsAndAddress: studentDocsAddress);

    final either = await usercase(params);
    expect(either.isRight(), isTrue);

    final result = either.fold(id, id);
    expect(result, isA<StudentDocsAddress>());
  });
  testWidgets("UpdateDocumentsAndAddressUsecase when update a left value",
      (tester) async {
    final studentDocsAddress = StudentDocsAddress(
        schoolInepIdFk: "schoolInepIdFk",
        studentFk: "studentFk",
        rgNumber: "rgNumber",
        edcensoUfFk: "edcensoUfFk",
        edcensoCityFk: "edcensoCityFk");
    final repository = MockStudentDocumentsAddressRepository();
    when(() => repository.update('', studentDocsAddress)).thenAnswer(
        (invocation) =>
            Future.value(left(const SocketException("Ocorreu um erro"))));

    final usercase = UpdateDocumentsAndAddressUsecase(repository);
    final params = UpdateDocumentsAndAddressParams(
        studentDocsId: '', studentDocumentsAndAddress: studentDocsAddress);

    final either = await usercase(params);
    expect(either.isLeft(), isTrue);

    final result = either.fold(id, id);
    expect(result, isA<SocketException>());
  });
}
