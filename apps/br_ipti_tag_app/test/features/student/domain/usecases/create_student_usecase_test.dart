import 'package:br_ipti_tag_app/app/features/student/domain/usecases/create_student_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_sdk/tag_sdk.dart';

class MockStudentRepository extends Mock implements StudentRepository {}

void main() {
  testWidgets(
    "CreateStudentsUsecase when create a right value",
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
      final usercase = CreateStudentsUsecase(repository);
      final params = CreateStudentParams(
        student: StudentIdentification(
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
    "CreateStudentsUsecase whenEmptyParams is equal value",
    (tester) async {
      final params = CreateStudentParams(
        student: StudentIdentification(
          registerType: "00",
          schoolInepIdFk: "21212121",
          name: "Aluno",
          birthday: "2002-02-02",
          sex: 1,
          colorRace: 1,
          filiation: 1,
        ),
      );
      final params2 = CreateStudentParams(
        student: StudentIdentification(
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
        equals([params2.student.name]),
      );
    },
  );

  testWidgets("CreateStudentsUsecase when create a left value", (tester) async {
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
    final usercase = CreateStudentsUsecase(repository);
    final params = CreateStudentParams(
      student: StudentIdentification(
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
