import 'package:br_ipti_tag_app/app/features/meals/data/datasources/local/ingredient_dumb_datasource.dart';
import 'package:br_ipti_tag_app/app/features/meals/data/datasources/remote/stock_remote_datasource.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/ingredient.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/repositories/ingredient_repository.dart';
import 'package:dartz/dartz.dart';

class IngredientRepositoryImpl implements IngredientRepository {
  IngredientRepositoryImpl({
    required this.dumbDataSource,
    required this.remoteDataSource,
  });

  final IngredientDumbDataSource dumbDataSource;
  final IngredientRemoteDataSource remoteDataSource;

  @override
  Future<Either<Exception, List<Ingredient>>> list() async {
    try {
      final result = await remoteDataSource.list();
      final mapped = [
        for (var item in result)
          Ingredient(
            name: item.food?.description ?? "",
            amount: item.amount,
            available: item.amount > 0,
            substitutionSuggestion: [],
          )
      ];
      return Right(mapped);
    } catch (e) {
      return Left(
        Exception("Não foi possível ler dados do JSON"),
      );
    }
  }

  @override
  Future<Either<Exception, Ingredient>> create(Ingredient ingredient) async {
    // final inventory = InvetoryIngredientModel(foodId: inve, schoolId: schoolId, amount: amount, expirationDate: expirationDate)
    // final result = await remoteDataSource.create(inventory);
    return right(ingredient);
  }
}
