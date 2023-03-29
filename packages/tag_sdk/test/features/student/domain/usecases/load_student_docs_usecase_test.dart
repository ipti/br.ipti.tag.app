import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_sdk/tag_sdk.dart';

class MockStudentDocumentsAddressRepository extends Mock
    implements StudentDocumentsAddressRepository {}

void main() {
  testWidgets("LoadStudentDocsUsecase when load a right value", (tester) async {
    final repository = MockStudentDocumentsAddressRepository();
    when(
      () => repository.getByStudentId(1),
    ).thenAnswer(
      (realInvocation) => Future.value(right(
        StudentDocsAndAddress(
          schoolIdentification: "schoolInepIdFk",
          studentFk: 1,
          rgNumber: "rgNumber",
          edcensoUfFk: 1,
          edcensoCityFk: 1,
        ),
      )),
    );
    final usecase = LoadStudentDocsUsecase(repository);
    final params = LoadStudentDocsParams(1, "");

    final either = await usecase(params);
    expect(either.isRight(), isTrue);

    final result = either.fold(id, id);
    expect(
      result,
      isA<StudentDocsAndAddress>(),
    );
  });
  testWidgets("LoadStudentDocsUsecase when load a left value", (tester) async {
    final repository = MockStudentDocumentsAddressRepository();
    when(
      () => repository.getByStudentId(1),
    ).thenAnswer(
      (realInvocation) => Future.value(left(
        const RestFailure("Ocorreu um erro"),
      )),
    );
    final usecase = LoadStudentDocsUsecase(repository);
    final params = LoadStudentDocsParams(1, "");
    final either = await usecase(params);
    expect(either.isLeft(), isTrue);
    final result = either.fold(id, id);
    expect(
      result,
      isA<RestFailure>(),
    );
  });
}
