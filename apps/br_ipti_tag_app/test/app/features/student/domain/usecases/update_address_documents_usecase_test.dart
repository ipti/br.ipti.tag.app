import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_sdk/tag_sdk.dart';

class MockStudentDocumentsAddressRepository extends Mock
    implements StudentDocumentsAddressRepository {}

void main() {
  testWidgets(
    "UpdateDocumentsAndAddressUsecase when update a right value",
    (tester) async {
      final studentDocsAddress = StudentDocsAddress(
        schoolInepIdFk: "schoolInepIdFk",
        studentFk: 1,
        rgNumber: "rgNumber",
        edcensoUfFk: 1,
        edcensoCityFk: 1,
      );
      final repository = MockStudentDocumentsAddressRepository();
      when(
        () => repository.update('', studentDocsAddress),
      ).thenAnswer((invocation) => Future.value(
            right(studentDocsAddress),
          ));

      final usercase = UpdateDocumentsAndAddressUsecase(repository);
      final params = UpdateDocumentsAndAddressParams(
        studentDocsId: '',
        studentDocumentsAndAddress: studentDocsAddress,
      );

      final either = await usercase(params);
      expect(either.isRight(), isTrue);

      final result = either.fold(id, id);
      expect(
        result,
        isA<StudentDocsAddress>(),
      );
    },
  );
  testWidgets(
    "UpdateDocumentsAndAddressUsecase when update a left value",
    (tester) async {
      final studentDocsAddress = StudentDocsAddress(
        schoolInepIdFk: "schoolInepIdFk",
        studentFk: 1,
        rgNumber: "rgNumber",
        edcensoUfFk: 1,
        edcensoCityFk: 1,
      );
      final repository = MockStudentDocumentsAddressRepository();
      when(
        () => repository.update('', studentDocsAddress),
      ).thenAnswer(
        (invocation) => Future.value(left(
          const SocketException("Ocorreu um erro"),
        )),
      );

      final usercase = UpdateDocumentsAndAddressUsecase(repository);
      final params = UpdateDocumentsAndAddressParams(
        studentDocsId: '',
        studentDocumentsAndAddress: studentDocsAddress,
      );

      final either = await usercase(params);
      expect(either.isLeft(), isTrue);

      final result = either.fold(id, id);
      expect(
        result,
        isA<SocketException>(),
      );
    },
  );
}
