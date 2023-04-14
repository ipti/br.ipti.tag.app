import 'package:br_ipti_tag_app/app/features/student/domain/usecases/delete_student_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_sdk/tag_sdk.dart';

class MockStudentRepository extends Mock implements StudentRepository {}

void main() {
  testWidgets("DeleteStudentsUsecase when delet a right value", (tester) async {
    final repository = MockStudentRepository();
    when(() => repository.delete(
          any(),
        )).thenAnswer((invocation) => Future.value(
          right(true),
        ));
    final usercase = DeleteStudentsUsecase(repository);
    const params = DeleteStudentParams(id: 0);
    final either = await usercase(params);
    final result = either.fold(id, id);
    expect(result, isTrue);
  });

  testWidgets(
    "DeleteStudentsUsecase whenEmptyParams is equal value",
    (tester) async {
      const params = DeleteStudentParams(id: 0);
      const params2 = DeleteStudentParams(id: 0);

      expect(
        params,
        equals([params2.id]),
      );
    },
  );
  testWidgets("DeleteStudentsUsecase when delet a left value", (tester) async {
    final repository = MockStudentRepository();
    when(() => repository.delete(
          any(),
        )).thenAnswer(
      (invocation) => Future.value(left(
        const RestFailure("Ocorreu um erro"),
      )),
    );
    final usercase = DeleteStudentsUsecase(repository);
    const params = DeleteStudentParams(id: 0);
    final either = await usercase(params);
    final result = either.fold(id, id);
    expect(
      result,
      isA<RestFailure>(),
    );
  });
}