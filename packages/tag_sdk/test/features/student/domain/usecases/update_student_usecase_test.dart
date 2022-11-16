import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/tag_sdk.dart';

class MockStudentRepository extends Mock implements StudentRepository {}

void main() {
  testWidgets("UpdateStudentUsecase when update a right value", (tester) async {
    final repository = MockStudentRepository();
    when(() => repository.update(
          any(),
          Student(),
        )).thenAnswer(
      (invocation) => Future.value(right(
        Student(),
      )),
    );
    final usercase = UpdateStudentUsecase(repository);
    final params = UpdateStudentParams(
      id: 1,
      student: Student(),
    );
    final either = await usercase(params);
    expect(either.isRight(), isTrue);

    final result = either.fold(id, id);
    expect(
      result,
      isA<Student>(),
    );
  });

  testWidgets(
    "UpdateStudentUsecase whenEmptyParams is equal value",
    (tester) async {
      final params = UpdateStudentParams(
        id: 1,
        student: Student(),
      );
      final params2 = UpdateStudentParams(
        id: 1,
        student: Student(),
      );

      expect(
        params,
        equals(params2),
      );
    },
  );

  testWidgets("UpdateStudentUsecase when update a left value", (tester) async {
    final repository = MockStudentRepository();
    when(() => repository.update(
          any(),
          Student(),
        )).thenAnswer(
      (invocation) => Future.value(left(
        const RestFailure("Ocorreu um erro"),
      )),
    );
    final usercase = UpdateStudentUsecase(repository);
    final params = UpdateStudentParams(
      id: 1,
      student: Student(),
    );
    final either = await usercase(params);
    expect(either.isLeft(), isTrue);

    final result = either.fold(id, id);
    expect(
      result,
      isA<RestFailure>(),
    );
  });
}
