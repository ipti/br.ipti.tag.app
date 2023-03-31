import 'package:br_ipti_tag_app/app/features/classroom/domain/usecases/list_classrooms_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_sdk/tag_sdk.dart';

class MockClassroomRepository extends Mock implements ClassroomRepository {}

void main() {
  group("ListStudentUsecase when returns a", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("right empty value", (tester) async {
      final repository = MockClassroomRepository();
      final params = ClassroomParams();
      when(() => repository.listAll(
            any(),
          )).thenAnswer(
        (realInvocation) => Future.value(
          right([]),
        ),
      );

      final usecase = ListClassroomsUsecase(repository);

      final either = await usecase(params);

      expect(either.isRight(), isTrue);

      final result = either.fold(id, id);
      expect(result, isEmpty);
    });

    testWidgets("left ConnexionExpection", (tester) async {
      final repository = MockClassroomRepository();
      when(() => repository.listAll(
            any(),
          )).thenAnswer(
        (realInvocation) => Future.value(left(
          const RestFailure("Conexão invalida"),
        )),
      );

      final usecase = ListClassroomsUsecase(repository);
      final params = ClassroomParams();

      final either = await usecase(params);

      expect(either.isLeft(), isTrue);

      final result = either.fold(id, id);

      expect(
        result,
        isA<RestFailure>(),
      );
    });
  });
}
