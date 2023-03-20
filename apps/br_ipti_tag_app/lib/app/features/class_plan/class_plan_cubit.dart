import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanClassState {
  List<PlanClass> planClass;
  bool newclass;
  PlanClassState({
    required this.planClass,
    required this.newclass,
  });


  PlanClassState copyWith({
    List<PlanClass>? planClass,
    bool? newclass,
  }) {
    return PlanClassState(
      planClass: planClass ?? this.planClass,
      newclass: newclass ?? this.newclass,
    );
  }
}

class ControllerPlanClass extends Cubit<PlanClassState> {

  ControllerPlanClass(): super(PlanClassState(planClass: <PlanClass>[PlanClass("Rochas", Etapas(name: 'name'), const Diciplinas(name: "name"))], newclass: false));
  
  createPlans(String namePlan, String nameEtapa, String nameDiciplina){
   // emit(state.copyWith(planClass:  [...state.planClass, PlanClass(namePlan, Etapas(name: nameEtapa),  Diciplinas(name: nameDiciplina))]));
    emit(state.copyWith(planClass: state.planClass..add(PlanClass(namePlan, Etapas(name: nameEtapa),  Diciplinas(name: nameDiciplina)))));
   // emit(state.copyWith(loading: true));
  }

  openNew(){
    emit(state.copyWith(newclass: true));
  }

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
