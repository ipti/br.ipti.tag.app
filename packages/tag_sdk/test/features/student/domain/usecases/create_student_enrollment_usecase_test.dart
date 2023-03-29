import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_sdk/tag_sdk.dart';

class MockStudentEnrollmentRepository extends Mock
    implements StudentEnrollmentRepository {}

void main() {
  testWidgets(
    "CreateStudentEnrollmentUsecase when create a right value",
    (tester) async {
      final Classroom = StudentEnrollment(
        schoolIdentification: "1",
        studentFk: 1,
        classroom: 1,
      );
      final repository = MockStudentEnrollmentRepository();
      when(
        () => repository.create(Classroom),
      ).thenAnswer((invocation) => Future.value(
            right(Classroom),
          ));

      final usercase = CreateStudentEnrollmentUsecase(repository);
      final params = CreateStudentEnrollmentParams(enrollment: Classroom);
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
      final Classroom = StudentEnrollment(
        schoolIdentification: "1",
        studentFk: 1,
        classroom: 1,
      );
      final repository = MockStudentEnrollmentRepository();
      when(
        () => repository.create(Classroom),
      ).thenAnswer(
        (invocation) => Future.value(left(
          const RestFailure("Ocorreu um erro"),
        )),
      );

      final usercase = CreateStudentEnrollmentUsecase(repository);
      final params = CreateStudentEnrollmentParams(enrollment: Classroom);

      final either = await usercase(params);
      final result = either.fold(id, id);
      expect(
        result,
        isA<RestFailure>(),
      );
    },
  );
}
