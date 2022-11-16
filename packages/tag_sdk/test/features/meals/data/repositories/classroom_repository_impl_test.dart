import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/tag_sdk.dart';

class MockClassroomRemoteDataSource extends Mock
    implements ClassroomRemoteDataSource {}

void main() {
  group("When list", () {
    final datasource = MockClassroomRemoteDataSource();
    final params = ClassroomParams();
    testWidgets("has right value", (tester) async {
      when(
        () => datasource.listAll(params),
      ).thenAnswer(
        (invocation) => Future.value([]),
      );

      final repository =
          ClassroomRepositoryImpl(classroomRemoteDataSource: datasource);
      final list = await repository.listAll(params);
      expect(list.isRight(), isTrue);
      final result = list.fold(id, id);
      expect(
        result,
        equals([]),
      );
    });
    testWidgets("has left value", (tester) async {
      when(() => datasource.listAll(
            ClassroomParams(),
          )).thenThrow(
        (invocation) => Failure("Não foi possível listar"),
      );

      final repository =
          ClassroomRepositoryImpl(classroomRemoteDataSource: datasource);
      final params = await repository.listAll(
        ClassroomParams(),
      );
      expect(params.isLeft(), isTrue);
      final result = params.fold(id, id);
      expect(
        result,
        isA<Exception>(),
      );
    });
  });
}
