import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/tag_sdk.dart';

class MockStudentRepository extends Mock implements StudentRepository {}

void main() {
  testWidgets(
    "CreateStudentsUsecase when create a right value",
    (tester) async {
      final repository = MockStudentRepository();
      when(() => repository.create(
            Student(),
          )).thenAnswer(
        (invocation) => Future.value(right(
          Student(),
        )),
      );
      final usercase = CreateStudentsUsecase(repository);
      final params = CreateStudentParams(
        student: Student(),
      );
      final either = await usercase(params);
      final result = either.fold(id, id);
      expect(
        result,
        isA<Student>(),
      );
    },
  );

  testWidgets(
    "CreateStudentsUsecase whenEmptyParams is equal value",
    (tester) async {
      final params = CreateStudentParams(
        student: Student(name: "abc"),
      );
      final params2 = CreateStudentParams(
        student: Student(name: "abc"),
      );
      expect(
        params,
        equals([params2.student.name]),
      );
    },
  );

  testWidgets("CreateStudentsUsecase when create a left value", (tester) async {
    final repository = MockStudentRepository();
    when(() => repository.create(
          Student(),
        )).thenAnswer(
      (invocation) => Future.value(left(
        const RestFailure("Ocorreu um erro"),
      )),
    );
    final usercase = CreateStudentsUsecase(repository);
    final params = CreateStudentParams(
      student: Student(),
    );
    final either = await usercase(params);
    final result = either.fold(id, id);
    expect(
      result,
      isA<RestFailure>(),
    );
  });
}
