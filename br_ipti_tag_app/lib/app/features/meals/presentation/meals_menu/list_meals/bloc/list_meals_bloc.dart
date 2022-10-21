import 'package:br_ipti_tag_app/app/core/defaults/usecase.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meals_menu.dart';
import 'package:br_ipti_tag_app/app/features/meals/domain/usecases/list_meals_menu_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_meals_events.dart';
import 'list_meals_states.dart';

class ListMealsBloc extends Bloc<ListMealsEvent, ListMealsState> {
  ListMealsBloc(this.listMealsMenuUsecase) : super(EmptyState()) {
    on<CleanFilterByTurnEvent>(
      (event, emit) async => emit(await _mapCleanFilterToState(event)),
    );
    on<FilterByTurnEvent>(
      (event, emit) async => emit(await _mapFilterByTurnToState(event)),
    );
    on<GetListMealsEvent>(
      (event, emit) async {
        emit(LoadingState());
        emit(await _mapGetListMealsToState());
      },
    );
  }

  final ListMealsMenuUsecase listMealsMenuUsecase;

  final List<String> turns = ["Manhã", "Tarde", "Noite"];

  final List<String> turnsFilters = [];

  List<MealsMenu> mealsOfDayCached = [];

  Future<ListMealsState> _mapGetListMealsToState() async {
    final resultEither = await listMealsMenuUsecase(
      NoParams(),
    );

    return resultEither.fold(
      (failure) {
        return FailedState(
          message: failure.toString(),
        );
      },
      (mealsOfDay) {
        mealsOfDayCached = mealsOfDay;
        if (mealsOfDay.isEmpty) {
          return FailedState(
            message: "Nenhuma refeição no dia",
          );
        }

        return LoadedState(mealsOfDay: mealsOfDayCached);
      },
    );
  }

  Future<ListMealsState> _mapFilterByTurnToState(
    FilterByTurnEvent event,
  ) async {
    turnsFilters.add(event.turn);
    final filteredDailyMeals = _applyTurnFilter(turnsFilters);

    return LoadedState(mealsOfDay: filteredDailyMeals);
  }

  Future<ListMealsState> _mapCleanFilterToState(
    CleanFilterByTurnEvent event,
  ) async {
    turnsFilters.remove(event.turn);
    if (turnsFilters.isEmpty) {
      return LoadedState(mealsOfDay: mealsOfDayCached);
    } else {
      final filteredDailyMeals = _applyTurnFilter(turnsFilters);

      return LoadedState(mealsOfDay: filteredDailyMeals);
    }
  }

  List<MealsMenu> _applyTurnFilter(List<String> turnsFilters) {
    return mealsOfDayCached.map((day) {
      final meals = day.meals
          .where(
            (meal) => turnsFilters.contains(meal.turn),
          )
          .toList();

      return MealsMenu(
        meals: meals,
        fullnameDay: day.fullnameDay,
        currentDate: day.currentDate,
      );
    }).toList();
  }
}
