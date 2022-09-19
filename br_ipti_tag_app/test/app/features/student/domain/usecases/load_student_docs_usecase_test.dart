import 'dart:io';

import 'package:br_ipti_tag_app/app/features/student/domain/entities/student_documents.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_doc_address_repositories.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/load_student_docs_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStudentDocumentsAddressRepository extends Mock
    implements StudentDocumentsAddressRepository {}

void main() {
  testWidgets("LoadStudentDocsUsecase when load a right value", (tester) async {
    final repository = MockStudentDocumentsAddressRepository();
    when(() => repository.getByStudentId('')).thenAnswer(
      (realInvocation) => Future.value(right(StudentDocsAddress(
          schoolInepIdFk: "schoolInepIdFk",
          studentFk: "studentFk",
          rgNumber: "rgNumber",
          edcensoUfFk: "edcensoUfFk",
          edcensoCityFk: "edcensoCityFk"))),
    );
    final usecase = LoadStudentDocsUsecase(repository);
    final params =  LoadStudentDocsParams("", "");

    final either = await usecase(params);
    expect(either.isRight(), isTrue);

    final result = either.fold(id, id);
    expect(result, isA<StudentDocsAddress>());
  });
  testWidgets("LoadStudentDocsUsecase when load a left value", (tester) async {
    final repository = MockStudentDocumentsAddressRepository();
    when(() => repository.getByStudentId('')).thenAnswer(
      (realInvocation) =>
          Future.value(left(const SocketException("Ocorreu um erro"))),
    );
    final usecase = LoadStudentDocsUsecase(repository);
    final params = LoadStudentDocsParams("", "");
    final either = await usecase(params);
    expect(either.isLeft(), isTrue);
    final result = either.fold(id, id);
    expect(result, isA<SocketException>());
  });
}
