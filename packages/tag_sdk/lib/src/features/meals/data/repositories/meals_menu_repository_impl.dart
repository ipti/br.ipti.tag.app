import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/meals/data/datasources/local/meals_menu_dumb_datasource.dart';
import 'package:tag_sdk/src/features/meals/data/datasources/remote/meals_remote_datasource.dart';
import 'package:tag_sdk/src/features/meals/domain/entities/meals_menu.dart';
import 'package:tag_sdk/src/features/meals/domain/repositories/meals_menu_repository.dart';
import 'package:tag_sdk/src/features/meals/mappers/meal_menu_api_to_entity.dart';

class MealsMenuRepositoryImpl implements MealsMenuRepository {
  MealsMenuRepositoryImpl({
    required this.remoteDataSource,
    required this.dumbDataSource,
    required this.mapper,
  });

  final MealsMenuDumbDataSource dumbDataSource;
  final MealsMenuRemoteDataSource remoteDataSource;
  final MealsMenuEntityMapper mapper;

  @override
  Future<Either<Failure, List<MealsMenu>>> list() async {
    try {
      final result = await dumbDataSource.listAll();
      final mappedResult = result
          .map(
            (e) => mapper(e),
          )
          .toList();

      return Right(mappedResult);
    } catch (e) {
      return Left(
        Failure("Não foi possível ler dados do JSON"),
      );
    }
  }
}
