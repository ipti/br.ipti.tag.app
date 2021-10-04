import 'package:br_ipti_tag_app/app/features/meals/data/datasources/meals_menu_dumb_datasource.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meals_menu.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/repositories/meals_menu_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class MealsMenuRepositoryImpl implements MealsMenuRepository {
  MealsMenuRepositoryImpl({
    @required this.dumbDataSource,
  });

  final MealsMenuDumbDataSource dumbDataSource;

  @override
  Future<Either<Exception, List<MealsMenu>>> list() async {
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
