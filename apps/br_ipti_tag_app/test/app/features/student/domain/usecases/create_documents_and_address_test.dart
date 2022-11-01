import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_sdk/tag_sdk.dart';

class MockStudentDocumentsAddressRepository extends Mock
    implements StudentDocumentsAddressRepository {}

void main() {
  testWidgets(
    "AddDocumentsAndAddressToStudentUsecase when create a right value",
    (tester) async {
      final studentDocsAddress = StudentDocsAddress(
        schoolInepIdFk: "schoolInepIdFk",
        studentFk: 1,
        rgNumber: "rgNumber",
        edcensoUfFk: "edcensoUfFk",
        edcensoCityFk: "edcensoCityFk",
      );

      final repository = MockStudentDocumentsAddressRepository();
      when(
        () => repository.create(studentDocsAddress),
      ).thenAnswer((invocation) => Future.value(
            right(studentDocsAddress),
          ));
      final usercase = AddDocumentsAndAddressToStudentUsecase(repository);
      final params = AddDocumentsAndAddressToStudentParams(
        studentDocumentsAddress: studentDocsAddress,
      );

      final either = await usercase(params);
      final result = either.fold(id, id);
      expect(
        result,
        isA<StudentDocsAddress>(),
      );
    },
  );
  testWidgets(
    "AddDocumentsAndAddressToStudentUsecase when create a left value",
    (tester) async {
      final studentDocsAddress = StudentDocsAddress(
        schoolInepIdFk: "schoolInepIdFk",
        studentFk: 1,
        rgNumber: "rgNumber",
        edcensoUfFk: "edcensoUfFk",
        edcensoCityFk: "edcensoCityFk",
      );
      final repository = MockStudentDocumentsAddressRepository();
      when(
        () => repository.create(studentDocsAddress),
      ).thenAnswer(
        (invocation) => Future.value(left(
          const SocketException("Ocorreu um erro"),
        )),
      );
      final usercase = AddDocumentsAndAddressToStudentUsecase(repository);
      final params = AddDocumentsAndAddressToStudentParams(
        studentDocumentsAddress: studentDocsAddress,
      );

      final either = await usercase(params);
      final result = either.fold(id, id);
      expect(
        result,
        isA<SocketException>(),
      );
    },
  );
}
