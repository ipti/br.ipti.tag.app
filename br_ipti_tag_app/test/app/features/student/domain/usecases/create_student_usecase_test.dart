import 'dart:io';

import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_repositories.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/create_student_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStudentRepository extends Mock implements StudentRepository {}

void main() {
  testWidgets("CreateStudentsUsecase when create a right value",
      (tester) async {
    final repository = MockStudentRepository();
    when(() => repository.create(Student()))
        .thenAnswer((invocation) => Future.value(right(Student())));
    final usercase = CreateStudentsUsecase(repository);
    final params = CreateStudentParams(student: Student());
    final either = await usercase(params);
    final result = either.fold(id, id);
    expect(result, isA<Student>());
  });

  testWidgets("CreateStudentsUsecase when params is equal value",
      (tester) async {
    final params = CreateStudentParams(student: Student(name: "abc"));
    final params2 = CreateStudentParams(student: Student(name: "abc"));
    expect(params.props, equals([params2.student.name]));
  });

  testWidgets("CreateStudentsUsecase when create a left value", (tester) async {
    final repository = MockStudentRepository();
    when(() => repository.create(Student())).thenAnswer((invocation) =>
        Future.value(left(const SocketException("Ocorreu um erro"))));
    final usercase = CreateStudentsUsecase(repository);
    final params = CreateStudentParams(student: Student());
    final either = await usercase(params);
    final result = either.fold(id, id);
    expect(result, isA<SocketException>());
  });
}
