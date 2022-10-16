import 'dart:io';

import 'package:br_ipti_tag_app/app/features/student/domain/entities/enrollment.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_enrollment_repositories.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/create_student_enrollment_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStudentEnrollmentRepository extends Mock
    implements StudentEnrollmentRepository {}

void main() {
  testWidgets(
    "CreateStudentEnrollmentUsecase when create a right value",
    (tester) async {
      final studentEnrollment = StudentEnrollment(
        schoolInepIdFk: "schoolInepIdFk",
        studentFk: 1,
        classroomFk: "classroomFk",
      );
      final repository = MockStudentEnrollmentRepository();
      when(
        () => repository.create(studentEnrollment),
      ).thenAnswer((invocation) => Future.value(
            right(studentEnrollment),
          ));

      final usercase = CreateStudentEnrollmentUsecase(repository);
      final params =
          CreateStudentEnrollmentParams(enrollment: studentEnrollment);
      final either = await usercase(params);
      final result = either.fold(id, id);
      expect(
        result,
        isA<StudentEnrollment>(),
      );
    },
  );
  testWidgets(
    "CreateStudentEnrollmentUsecase when create a left value",
    (tester) async {
      final studentEnrollment = StudentEnrollment(
        schoolInepIdFk: "schoolInepIdFk",
        studentFk: 1,
        classroomFk: "classroomFk",
      );
      final repository = MockStudentEnrollmentRepository();
      when(
        () => repository.create(studentEnrollment),
      ).thenAnswer(
        (invocation) => Future.value(left(
          const SocketException("Ocorreu um erro"),
        )),
      );

      final usercase = CreateStudentEnrollmentUsecase(repository);
      final params =
          CreateStudentEnrollmentParams(enrollment: studentEnrollment);

      final either = await usercase(params);
      final result = either.fold(id, id);
      expect(
        result,
        isA<SocketException>(),
      );
    },
  );
}
