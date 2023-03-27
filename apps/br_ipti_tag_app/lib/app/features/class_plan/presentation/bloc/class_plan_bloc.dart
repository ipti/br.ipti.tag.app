import 'package:br_ipti_tag_app/app/features/class_plan/presentation/bloc/class_plan_state.dart';
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/create_class_plans/create_class/bloc/create_class_state.dart';
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/create_class_plans/create_plans/bloc/create_plans_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ControllerPlanClass extends Cubit<ClassPlanState> {
  int tabIndex = 0;

  ControllerPlanClass() : super(ClassPlanInitialState());

  void createPlans(String namePlan, String nameEtapa, String nameDiciplina) {
    // emit(state.copyWith(planClass:  [...state.planClass, PlanClass(namePlan, Etapas(name: nameEtapa),  Diciplinas(name: nameDiciplina))]));
    // emit(state.copyWith(
    //     planClass: state.planClass
    //       ..add(PlanClass(namePlan, Etapas(name: nameEtapa),
    //           Diciplinas(name: nameDiciplina),)),));
    // emit(state.copyWith(loading: true));
  }



  loadPlanClasses(CreatePlansState statePlanClass){
    
  }

  void openNew() {
    emit(state.copyWith(newclass: true));
  }

}

class PlanClass {
  final String name;
  final Etapas etapas;
  final Diciplinas diciplinas;
  final List<Classes> classes;

  const PlanClass(
    this.name,
    this.etapas,
    this.diciplinas,
    this.classes,
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
