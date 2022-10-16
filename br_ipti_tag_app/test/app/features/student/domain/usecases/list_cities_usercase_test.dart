import 'dart:io';

import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/repositories/student_repositories.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/usecases/list_cities_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStudentRepository extends Mock implements StudentRepository {}

void main() {
  group("NoParams when returns a", () {
    testWidgets("right empty value", (tester) async {
      final repository = MockStudentRepository();
      when(
        () => repository.listAll(schoolId: ''),
      ).thenAnswer(
        (realInvocation) => Future.value(
          right([]),
        ),
      );

      final usecase = ListStudentsUsecase(repository);
      final params = NoParams();

      final either = await usecase(params);

      expect(either.isRight(), isTrue);

      final result = either.fold(id, id);
      expect(result, isEmpty);
    });
    testWidgets("left ConnexionExpection", (tester) async {
      final repository = MockStudentRepository();
      when(
        () => repository.listAll(schoolId: ''),
      ).thenAnswer(
        (realInvocation) => Future.value(left(
          const SocketException("Conexão invalida"),
        )),
      );
      final usecase = ListStudentsUsecase(repository);
      final params = NoParams();

      final either = await usecase(params);

      expect(either.isLeft(), isTrue);

      final result = either.fold(id, id);

      expect(
        result,
        isA<SocketException>(),
      );
    });
  });
}
