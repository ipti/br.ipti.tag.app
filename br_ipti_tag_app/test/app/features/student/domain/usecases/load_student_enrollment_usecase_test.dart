import 'dart:io';

import 'package:br_ipti_tag_app/app/features/student/domain/entities/enrollment.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_enrollment_repositories.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/load_student_enrollment_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStudentEnrollmentRepository extends Mock
    implements StudentEnrollmentRepository {}

void main() {
  testWidgets("LoadStudentEnrollmentParams when load a right value",
      (tester) async {
    final repository = MockStudentEnrollmentRepository();
    when(() => repository.getStudentById('')).thenAnswer(
      (invocation) => Future.value(right(StudentEnrollment(
          schoolInepIdFk: "schoolInepIdFk",
          studentFk: "studentFk",
          classroomFk: "classroomFk"))),
    );
    final usecase = LoadStudentEnrollmentUsecase(repository);
    final params = LoadStudentEnrollmentParams("", "");

    final either = await usecase(params);
    expect(either.isRight(), isTrue);

    final result = either.fold(id, id);
    expect(result, isA<StudentEnrollment>());
  });
  testWidgets("LoadStudentEnrollmentParams when load a left value",
      (tester) async {
    final repository = MockStudentEnrollmentRepository();
    when(() => repository.getStudentById('')).thenAnswer(
      (invocation) => 
        Future.value(left(const SocketException("Ocorreu um erro"))),
    );
    final usecase = LoadStudentEnrollmentUsecase(repository);
    final params = LoadStudentEnrollmentParams("", "");
    
    final either = await usecase(params);
    expect(either.isLeft(), isTrue);

    final result = either.fold(id, id);
    expect(result, isA<SocketException>());
  });
}
