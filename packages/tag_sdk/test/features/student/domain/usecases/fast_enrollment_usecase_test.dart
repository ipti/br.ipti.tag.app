import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/tag_sdk.dart';

class MockStudentRepository extends Mock implements StudentRepository {}

void main() {
  testWidgets(
    "FastEnrollmentUsecase when create a right value",
    (tester) async {
      final repository = MockStudentRepository();
      when(() => repository.create(
            StudentIdentification(
              registerType: "00",
              schoolInepIdFk: "21212121",
              name: "Aluno",
              birthday: "2002-02-02",
              sex: 1,
              colorRace: 1,
              filiation: 1,
            ),
          )).thenAnswer(
        (invocation) => Future.value(right(
          StudentIdentification(
            registerType: "00",
            schoolInepIdFk: "21212121",
            name: "Aluno",
            birthday: "2002-02-02",
            sex: 1,
            colorRace: 1,
            filiation: 1,
          ),
        )),
      );

      final usercase = FastEnrollmentUsecase(repository);
      final params = EnrollmentParams(
        StudentIdentification(
          registerType: "00",
          schoolInepIdFk: "21212121",
          name: "Aluno",
          birthday: "2002-02-02",
          sex: 1,
          colorRace: 1,
          filiation: 1,
        ),
      );
      final either = await usercase(params);
      final result = either.fold(id, id);
      expect(
        result,
        isA<StudentIdentification>(),
      );
    },
  );

  testWidgets(
    "FastEnrollmentUsecase whenEmptyParams is equal value",
    (tester) async {
      final params = EnrollmentParams(
        StudentIdentification(
          registerType: "00",
          schoolInepIdFk: "21212121",
          name: "Aluno",
          birthday: "2002-02-02",
          sex: 1,
          colorRace: 1,
          filiation: 1,
        ),
      );
      final params2 = EnrollmentParams(
        StudentIdentification(
          registerType: "00",
          schoolInepIdFk: "21212121",
          name: "Aluno",
          birthday: "2002-02-02",
          sex: 1,
          colorRace: 1,
          filiation: 1,
        ),
      );

      expect(
        params,
        equals(params2),
      );
    },
  );
  testWidgets("FastEnrollmentUsecase when create a left value", (tester) async {
    final repository = MockStudentRepository();
    when(() => repository.create(
          StudentIdentification(
            registerType: "00",
            schoolInepIdFk: "21212121",
            name: "Aluno",
            birthday: "2002-02-02",
            sex: 1,
            colorRace: 1,
            filiation: 1,
          ),
        )).thenAnswer(
      (invocation) => Future.value(left(
        const RestFailure("Ocorreu um erro"),
      )),
    );

    final usercase = FastEnrollmentUsecase(repository);
    final params = EnrollmentParams(
      StudentIdentification(
        registerType: "00",
        schoolInepIdFk: "21212121",
        name: "Aluno",
        birthday: "2002-02-02",
        sex: 1,
        colorRace: 1,
        filiation: 1,
      ),
    );
    final either = await usercase(params);
    final result = either.fold(id, id);
    expect(
      result,
      isA<RestFailure>(),
    );
  });
}
