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
      final studentDocsAddress = StudentDocsAndAddress(
        schoolIdentification: "schoolIdentification",
        studentFk: 1,
        rgNumber: "rgNumber",
        edcensoUfFk: 1,
        edcensoCityFk: 1,
      );
      final repository = MockStudentDocumentsAddressRepository();
      when(
        () => repository.update(1, studentDocsAddress),
      ).thenAnswer((invocation) => Future.value(
            right(studentDocsAddress),
          ));

      final usercase = UpdateDocumentsAndAddressUsecase(repository);
      final params = UpdateDocumentsAndAddressParams(
        studentDocsId: 1,
        studentDocumentsAndAddress: studentDocsAddress,
      );

      final either = await usercase(params);
      expect(either.isRight(), isTrue);

      final result = either.fold(id, id);
      expect(
        result,
        isA<StudentDocsAndAddress>(),
      );
    },
  );
  testWidgets(
    "UpdateDocumentsAndAddressUsecase when update a left value",
    (tester) async {
      final studentDocsAddress = StudentDocsAndAddress(
        schoolIdentification: "schoolIdentification",
        studentFk: 1,
        rgNumber: "rgNumber",
        edcensoUfFk: 1,
        edcensoCityFk: 1,
      );
      final repository = MockStudentDocumentsAddressRepository();
      when(
        () => repository.update(1, studentDocsAddress),
      ).thenAnswer(
        (invocation) => Future.value(left(
          const RestFailure("Ocorreu um erro"),
        )),
      );

      final usercase = UpdateDocumentsAndAddressUsecase(repository);
      final params = UpdateDocumentsAndAddressParams(
        studentDocsId: 1,
        studentDocumentsAndAddress: studentDocsAddress,
      );

      final either = await usercase(params);
      expect(either.isLeft(), isTrue);

      final result = either.fold(id, id);
      expect(
        result,
        isA<RestFailure>(),
      );
    },
  );
}
