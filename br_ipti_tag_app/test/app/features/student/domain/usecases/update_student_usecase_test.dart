import 'dart:io';

import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_repositories.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/update_student_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

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
    "UpdateStudentUsecase when params is equal value",
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
        params.props,
        equals(params2.props),
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
        const SocketException("Ocorreu um erro"),
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
      isA<SocketException>(),
    );
  });
}
