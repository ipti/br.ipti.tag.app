import 'package:br_ipti_tag_app/app/features/student/domain/usecases/load_student_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_sdk/tag_sdk.dart';

class MockStudentRepository extends Mock implements StudentRepository {}

void main() {
  testWidgets("LoadStudentUsecase when load a right value", (tester) async {
    final repository = MockStudentRepository();
    when(
      () => repository.getById(0, schoolId: ''),
    ).thenAnswer(
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

    final usecase = LoadStudentUsecase(repository);
    final params = LoadStudentParams(0, "");

    final either = await usecase(params);
    expect(either.isRight(), isTrue);
    final result = either.fold(id, id);
    expect(
      result,
      isA<StudentIdentification>(),
    );
  });
  testWidgets("LoadStudentUsecase when load a left value", (tester) async {
    final repository = MockStudentRepository();
    when(
      () => repository.getById(0, schoolId: ''),
    ).thenAnswer(
      (invocation) => Future.value(left(
        const RestFailure("Ocorreu um erro"),
      )),
    );

    final usecase = LoadStudentUsecase(repository);
    final params = LoadStudentParams(0, "");

    final either = await usecase(params);
    expect(either.isLeft(), isTrue);
    final result = either.fold(id, id);
    expect(
      result,
      isA<RestFailure>(),
    );
  });
}
