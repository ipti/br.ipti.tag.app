import 'package:br_ipti_tag_app/app/features/enrollment/domain/entities/student.dart';
import 'package:br_ipti_tag_app/app/features/enrollment/domain/usecases/fast_enrollment_usecase.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'personal_form_events.dart';
import 'personal_form_states.dart';

class PersonalFormBloc extends Bloc<PersonalFormEvent, PersonalFormState> {
  PersonalFormBloc(
    this._enrollmentUsecase,
  ) : super(const PersonalFormState());

  final FastEnrollmentUsecase _enrollmentUsecase;

  Student student = Student();

  final sexItems = <int, String>{1: "Masculino", 2: "Feminino"};

  final colorRaceItems = <int, String>{
    0: "Não declarada",
    1: "Branca",
    2: "Preta",
    3: "Parda",
    4: "Amarela",
    5: "Indígena",
  };

  final filiationItems = <int, String>{
    0: "Não declarado/Ignorado",
    1: "Pai e/ou Mãe",
  };

  final nationalityItems = <int, String>{
    1: "Brasileira",
    2: "Brasileira: Nascido no exterior ou Naturalizado",
    3: "Estrangeira"
  };

  final residenceZoneItems = <int, String>{
    1: "URBANA",
    2: "RURAL",
  };

  final classesItems = <int, String>{
    1: "Turma 1",
    2: "Turma 2",
  };

  setName(String value) => add(NameChanged(value));
  setBirthday(String value) => add(BirthdayChanged(value));
  setSex(int value) => add(SexChanged(value));
  setColorRace(int value) => add(ColorRaceChanged(value));
  setFiliation(int value) => add(FiliationChanged(value));
  setNationality(int value) => add(NationalityChanged(value));
  setDeficiency(bool value) => add(DeficiencyChanged(value));
  setFoodRestriction(String value) => add(FoodRestrictionChanged(value));

  @override
  void onTransition(
      Transition<PersonalFormEvent, PersonalFormState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<PersonalFormState> mapEventToState(PersonalFormEvent event) async* {
    if (event is NameChanged) {
      yield state.copyWith(name: event.name);
    } else if (event is BirthdayChanged) {
      yield state.copyWith(birthday: event.birtday);
    } else if (event is SexChanged) {
      yield state.copyWith(sex: event.sex);
    } else if (event is ColorRaceChanged) {
      yield state.copyWith(colorRace: event.colorRace);
    } else if (event is NationalityChanged) {
      yield state.copyWith(nationality: event.nationality);
    } else if (event is FiliationChanged) {
      yield state.copyWith(filiation: event.filiation);
    } else if (event is DeficiencyChanged) {
      yield state.copyWith(deficiency: event.deficiency);
    } else if (event is FoodRestrictionChanged) {
      yield state.copyWith(foodRestrictions: event.foodRestrictions);
    } else if (event is SubmitPersonalForm) {
      Student student = Student(
        name: state.name,
        birthday: state.birthday,
        sex: state.sex,
        colorRace: state.colorRace,
        nationality: state.nationality,
        filiation: state.filiation,
        deficiency: state.deficiency,
      );

      final result = await _enrollmentUsecase(EnroolmentParams(student));
      result.fold((l) => null, (r) => add(SubmitedSuccess()));
    } else if (event is SubmitedSuccess) {}
  }
}
