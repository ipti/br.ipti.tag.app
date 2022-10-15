import 'dart:io';

import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_repositories.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/load_student_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStudentRepository extends Mock implements StudentRepository {}

void main() {
  testWidgets("LoadStudentUsecase when load a right value", (tester) async {
    final repository = MockStudentRepository();
    when(() => repository.getById('', schoolId: ''))
        .thenAnswer((invocation) => Future.value(right(Student())));

    final usecase = LoadStudentUsecase(repository);
    final params = LoadStudentParams("", "");

    final either = await usecase(params);
    expect(either.isRight(), isTrue);
    final result = either.fold(id, id);
    expect(result, isA<Student>());
  });
  testWidgets("LoadStudentUsecase when load a left value", (tester) async {
    final repository = MockStudentRepository();
    when(() => repository.getById('', schoolId: '')).thenAnswer((invocation) =>
        Future.value(left(const SocketException("Ocorreu um erro"))));

    final usecase = LoadStudentUsecase(repository);
    final params = LoadStudentParams("", "");

    final either = await usecase(params);
    expect(either.isLeft(), isTrue);
    final result = either.fold(id, id);
    expect(result, isA<SocketException>());
  });
}
