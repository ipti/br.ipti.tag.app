import 'package:br_ipti_tag_app/app/features/meals/data/datasources/ingredient_dumb_datasource.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/ingredient.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/repositories/ingredient_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class IngredientRepositoryImpl implements IngredientRepository {
  IngredientRepositoryImpl({
    @required this.dumbDataSource,
  });

  final IngredientDumbDataSource dumbDataSource;

  @override
  Future<Either<Exception, List<Ingredient>>> list() async {
    try {
      final result = await dumbDataSource.list();
      return Right(result);
    } catch (e) {
      return Left(
        Exception("Não foi possível ler dados do JSON"),
      );
    }
  }
}
