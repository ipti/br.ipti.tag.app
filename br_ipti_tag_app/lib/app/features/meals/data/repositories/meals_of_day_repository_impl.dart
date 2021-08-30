import 'package:br_ipti_tag_app/app/features/meals/data/datasources/meals_of_day_dumb_datasource.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meals_of_day.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/repositories/meals_of_day_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class MealsOfDayRepositoryImpl implements MealsOfDayRepository {
  MealsOfDayRepositoryImpl({
    @required this.dumbDataSource,
  });

  final MealsOfDayDumbDataSource dumbDataSource;

  @override
  Future<Either<Exception, List<MealsOfDay>>> list() async {
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
