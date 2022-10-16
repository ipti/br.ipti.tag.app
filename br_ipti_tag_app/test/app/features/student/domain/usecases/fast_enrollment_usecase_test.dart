import 'dart:io';

import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_repositories.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/fast_enrollment_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStudentRepository extends Mock implements StudentRepository {}

void main() {
  testWidgets(
    "FastEnrollmentUsecase when create a right value",
    (tester) async {
      final repository = MockStudentRepository();
      when(() => repository.create(
            Student(),
          )).thenAnswer(
        (invocation) => Future.value(right(
          Student(),
        )),
      );

      final usercase = FastEnrollmentUsecase(repository);
      final params = EnrollmentParams(
        Student(),
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
    "FastEnrollmentUsecase when params is equal value",
    (tester) async {
      final params = EnrollmentParams(
        Student(),
      );
      final params2 = EnrollmentParams(
        Student(),
      );

      expect(
        params.props,
        equals(params2.props),
      );
    },
  );
  testWidgets("FastEnrollmentUsecase when create a left value", (tester) async {
    final repository = MockStudentRepository();
    when(() => repository.create(
          Student(),
        )).thenAnswer(
      (invocation) => Future.value(left(
        const SocketException("Ocorreu um erro"),
      )),
    );

    final usercase = FastEnrollmentUsecase(repository);
    final params = EnrollmentParams(
      Student(),
    );
    final either = await usercase(params);
    final result = either.fold(id, id);
    expect(
      result,
      isA<SocketException>(),
    );
  });
}
