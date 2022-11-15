import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_sdk/tag_sdk.dart';

class MockStudentEnrollmentRepository extends Mock
    implements StudentEnrollmentRepository {}

void main() {
  testWidgets(
    "LoadStudentEnrollmentParams when load a right value",
    (tester) async {
      final repository = MockStudentEnrollmentRepository();
      when(
        () => repository.getStudentById(1),
      ).thenAnswer(
        (invocation) => Future.value(right(
          StudentEnrollment(
            schoolInepIdFk: "schoolInepIdFk",
            studentFk: 1,
            classroomFk: "classroomFk",
          ),
        )),
      );
      final usecase = LoadStudentEnrollmentUsecase(repository);
      final params = LoadStudentEnrollmentParams(1, "");

      final either = await usecase(params);
      expect(either.isRight(), isTrue);

      final result = either.fold(id, id);
      expect(
        result,
        isA<StudentEnrollment>(),
      );
    },
  );
  testWidgets(
    "LoadStudentEnrollmentParams when load a left value",
    (tester) async {
      final repository = MockStudentEnrollmentRepository();
      when(
        () => repository.getStudentById(1),
      ).thenAnswer(
        (invocation) => Future.value(left(
          const SocketException("Ocorreu um erro"),
        )),
      );
      final usecase = LoadStudentEnrollmentUsecase(repository);
      final params = LoadStudentEnrollmentParams(1, "");

      final either = await usecase(params);
      expect(either.isLeft(), isTrue);

      final result = either.fold(id, id);
      expect(
        result,
        isA<SocketException>(),
      );
    },
  );
}
