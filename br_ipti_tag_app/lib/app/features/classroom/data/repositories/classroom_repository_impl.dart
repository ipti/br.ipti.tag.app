import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/repositories/classroom_repository.dart';
import 'package:dartz/dartz.dart';

class ClassroomRepositoryImpl extends ClassroomRepository {
  @override
  Future<Either<Exception, bool>> create(Classroom classroom) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, List<Classroom>>> list() async {
    return Right(<Classroom>[
      Classroom(
        name: "1º ano Ensino Fundamental",
        endTime: null,
        startTime: null,
        modalityId: 0,
        stageId: 0,
        typePedagogicMediationId: 0,
      ),
      Classroom(
        name: "3º ano Ensino Fundamental",
        endTime: null,
        startTime: null,
        modalityId: 0,
        stageId: 0,
        typePedagogicMediationId: 0,
      ),
      Classroom(
        name: "4º ano Ensino Fundamental",
        endTime: null,
        startTime: null,
        modalityId: 0,
        stageId: 0,
        typePedagogicMediationId: 0,
      ),
    ]);
  }
}
