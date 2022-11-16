import 'package:dartz/dartz.dart';
import 'package:tag_sdk/src/core/failures/failures.dart';
import 'package:tag_sdk/src/features/meals/data/datasources/local/ingredient_dumb_datasource.dart';
import 'package:tag_sdk/src/features/meals/data/datasources/remote/stock_remote_datasource.dart';
import 'package:tag_sdk/src/features/meals/domain/entities/ingredient.dart';
import 'package:tag_sdk/src/features/meals/domain/repositories/ingredient_repository.dart';

class IngredientRepositoryImpl implements IngredientRepository {
  IngredientRepositoryImpl({
    required this.dumbDataSource,
    required this.remoteDataSource,
  });

  final IngredientDumbDataSource dumbDataSource;
  final IngredientRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<Ingredient>>> list() async {
    try {
      final result = await remoteDataSource.list();

      return Right(result);
    } catch (e) {
      return Left(
        Failure("Não foi possível ler dados do JSON"),
      );
    }
  }
}
