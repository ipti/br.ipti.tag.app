import 'package:br_ipti_tag_app/app/features/class_plan/presentation/bloc/class_plan_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ControllerPlanClass extends Cubit<ClassPlanState> {
  int tabIndex = 0;

  ControllerPlanClass() : super(const ClassPlanInitialState());

  void createPlans(String namePlan, String nameEtapa, String nameDiciplina) {
    // emit(state.copyWith(planClass:  [...state.planClass, PlanClass(namePlan, Etapas(name: nameEtapa),  Diciplinas(name: nameDiciplina))]));
    emit(state.copyWith(
        planClass: state.planClass
          ..add(PlanClass(namePlan, Etapas(name: nameEtapa),
              Diciplinas(name: nameDiciplina),)),));
    // emit(state.copyWith(loading: true));
  }

  void openNew() {
    emit(state.copyWith(newclass: true));
  }

//  void nextTab() {
//     emit(
//       ClassPlanNextTabState(
//         tabIndex: tabIndex + 1,
//       ),
//     );
//   }

}

class PlanClass {
  final String name;
  final Etapas etapas;
  final Diciplinas diciplinas;

  const PlanClass(
    this.name,
    this.etapas,
    this.diciplinas,
  );
}

class Etapas {
  final String name;
  const Etapas({
    required this.name,
  });
}

class Diciplinas {
  final String name;
  const Diciplinas({
    required this.name,
  });
}
