import 'dart:io';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_repositories.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/delete_student_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStudentRepository extends Mock implements StudentRepository {}

void main() {
  testWidgets("DeleteStudentsUsecase when delet a right value", (tester) async {
    final repository = MockStudentRepository();
    when(() => repository.delete(any()))
        .thenAnswer((invocation) => Future.value(right(true)));
    final usercase = DeleteStudentsUsecase(repository);
    const params = DeleteStudentParams(id: "");
    final either = await usercase(params);
    final result = either.fold(id, id);
    expect(result, isTrue);
  });

  testWidgets("DeleteStudentsUsecase when params is equal value", (tester) async {
    const params = DeleteStudentParams(id: "1");
    const params2 = DeleteStudentParams(id: "1");

    expect(params.props, equals([params2.id]));
  });
  testWidgets("DeleteStudentsUsecase when delet a left value", (tester) async {
    final repository = MockStudentRepository();
    when(() => repository.delete(any())).thenAnswer((invocation) =>
        Future.value(left(const SocketException("Ocorreu um erro"))));
    final usercase = DeleteStudentsUsecase(repository);
    const params = DeleteStudentParams(id: "");
    final either = await usercase(params);
    final result = either.fold(id, id);
    expect(result, isA<SocketException>());
  });
}
