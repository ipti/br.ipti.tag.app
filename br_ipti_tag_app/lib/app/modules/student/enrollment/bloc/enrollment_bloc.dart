import 'package:br_ipti_tag_app/app/domain/data/entities/student.dart';
import 'package:br_ipti_tag_app/app/domain/domain/usecases/fast_enrollment_usecase.dart';
import 'package:br_ipti_tag_app/app/modules/student/enrollment/bloc/enrollment_events.dart';
import 'package:br_ipti_tag_app/app/modules/student/enrollment/bloc/enrollment_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EnrollmentBloc extends Bloc<EnrollmentEvent, EnrollmentState> {
  EnrollmentBloc() : super(const EnrollmentState());

  FastEnrollmentUsecase _enrollmentUsecase = Modular.get();

  final modulo = Modular.get<FastEnrollmentUsecase>();

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

  setName(String value) => add(NameChanged(value));
  setBirthday(String value) => add(BirthdayChanged(value));
  setSex(int value) => add(SexChanged(value));
  setColorRace(int value) => add(ColorRaceChanged(value));
  setFiliation(int value) => add(FiliationChanged(value));
  setNationality(int value) => add(NationalityChanged(value));
  setDeficiency(bool value) => add(DeficiencyChanged(value));
  setResidenceZone(int value) => add(ColorRaceChanged(value));

  @override
  void onTransition(Transition<EnrollmentEvent, EnrollmentState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<EnrollmentState> mapEventToState(EnrollmentEvent event) async* {
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
    } else if (event is ResidenceZoneChanged) {
      yield state.copyWith(residenceZone: event.residenceZone);
    } else if (event is SubmitEnrollment) {
      Student student = Student(
        name: state.name,
        birthday: state.birthday,
        sex: state.sex,
        colorRace: state.colorRace,
        nationality: state.nationality,
        filiation: state.filiation,
        deficiency: state.deficiency,
      );

      final result = await _enrollmentUsecase.call(student);
      result.fold((l) => null, (r) => add(SubmitedSuccess()));
    } else if (event is SubmitedSuccess) {}
  }
}
