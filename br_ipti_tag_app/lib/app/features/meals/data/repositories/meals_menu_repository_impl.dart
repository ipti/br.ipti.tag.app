import 'package:br_ipti_tag_app/app/features/meals/data/datasources/local/meals_menu_dumb_datasource.dart';
import 'package:br_ipti_tag_app/app/features/meals/data/datasources/remote/meals_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meals_menu.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/repositories/meals_menu_repository.dart';
import 'package:br_ipti_tag_app/app/features/meals/mappers/meal_menu_api_to_entity.dart';
import 'package:dartz/dartz.dart';

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
  Future<Either<Exception, List<MealsMenu>>> list() async {
    try {
      final result = await remoteDataSource.listAll();
      final mappedResult = result.map((e) => mapper(e)).toList();
      return Right(mappedResult);
    } catch (e) {
      return Left(
        Exception("Não foi possível ler dados do JSON"),
      );
    }
  }
}
