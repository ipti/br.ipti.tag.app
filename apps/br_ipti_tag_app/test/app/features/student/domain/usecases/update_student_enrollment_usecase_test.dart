import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_sdk/tag_sdk.dart';

class MockStudentEnrollmentRepository extends Mock
    implements StudentEnrollmentRepository {}

void main() {
  testWidgets(
    "UpdateStudentEnrollmentUsecase when update a right value",
    (tester) async {
      final studentEnrollment = StudentEnrollment(
        schoolInepIdFk: "schoolInepIdFk",
        studentFk: 1,
        classroomFk: "classroomFk",
      );

      final repository = MockStudentEnrollmentRepository();

      when(
        () => repository.update(any(), studentEnrollment),
      ).thenAnswer((invocation) => Future.value(
            right(studentEnrollment),
          ));

      final usercase = UpdateStudentEnrollmentUsecase(repository);
      final params = UpdateStudentEnrollmentParams(
        enrollmentId: "enrollmentId",
        enrollment: studentEnrollment,
      );

      final either = await usercase(params);
      expect(either.isRight(), isTrue);

      final result = either.fold(id, id);
      expect(
        result,
        isA<StudentEnrollment>(),
      );
    },
  );
  testWidgets(
    "UpdateStudentEnrollmentUsecase when update a left value",
    (tester) async {
      final studentEnrollment = StudentEnrollment(
        schoolInepIdFk: "schoolInepIdFk",
        studentFk: 1,
        classroomFk: "classroomFk",
      );

      final repository = MockStudentEnrollmentRepository();

      when(
        () => repository.update('', studentEnrollment),
      ).thenAnswer(
        (invocation) => Future.value(left(
          const SocketException("Ocorreu um erro"),
        )),
      );

      final usercase = UpdateStudentEnrollmentUsecase(repository);
      final params = UpdateStudentEnrollmentParams(
        enrollmentId: "",
        enrollment: studentEnrollment,
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
