import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/tag_sdk.dart';

class MockStudentRepository extends Mock implements StudentRepository {}

void main() {
  testWidgets("LoadStudentUsecase when load a right value", (tester) async {
    final repository = MockStudentRepository();
    when(
      () => repository.getById('', schoolId: ''),
    ).thenAnswer(
      (invocation) => Future.value(right(
        Student(),
      )),
    );

    final usecase = LoadStudentUsecase(repository);
    final params = LoadStudentParams("", "");

    final either = await usecase(params);
    expect(either.isRight(), isTrue);
    final result = either.fold(id, id);
    expect(
      result,
      isA<Student>(),
    );
  });
  testWidgets("LoadStudentUsecase when load a left value", (tester) async {
    final repository = MockStudentRepository();
    when(
      () => repository.getById('', schoolId: ''),
    ).thenAnswer(
      (invocation) => Future.value(left(
        const RestFailure("Ocorreu um erro"),
      )),
    );

    final usecase = LoadStudentUsecase(repository);
    final params = LoadStudentParams("", "");

    final either = await usecase(params);
    expect(either.isLeft(), isTrue);
    final result = either.fold(id, id);
    expect(
      result,
      isA<RestFailure>(),
    );
  });
}
