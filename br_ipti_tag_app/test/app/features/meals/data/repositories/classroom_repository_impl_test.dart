import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_classrooms_usecase.dart';
import 'package:br_ipti_tag_app/app/features/student/data/datasources/remote/classroom_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/student/data/repositories/classroom_repository_impl.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockClassroomRemoteDataSource extends Mock
    implements ClassroomRemoteDataSource {}

void main() {
  group("When listAll", () {
    final datasource = MockClassroomRemoteDataSource();
    final params = ClassroomParams();
    testWidgets("has right value", (tester) async {
      when(
        () => datasource.listAll(params),
      ).thenAnswer(
        (invocation) => Future.value([]),
      );

      final repository = ClassroomRepositoryImpl(datasource);
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
        (invocation) => Exception("Não foi possível listar"),
      );

      final repository = ClassroomRepositoryImpl(datasource);
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
