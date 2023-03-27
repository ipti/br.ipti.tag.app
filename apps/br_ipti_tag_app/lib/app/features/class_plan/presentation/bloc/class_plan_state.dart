import 'package:br_ipti_tag_app/app/features/class_plan/presentation/create_class_plans/create_class/bloc/create_class_state.dart';
import 'package:equatable/equatable.dart';

import 'class_plan_bloc.dart';

class ClassPlanState extends Equatable {
  final List<PlanClass> planClass;
  final int tabIndex;
  final bool newclass;
  const ClassPlanState({
    this.tabIndex = 0,
    required this.planClass,
    required this.newclass,
  });

  ClassPlanState copyWith({
    List<PlanClass>? planClass,
    bool? newclass,
  }) {
    return ClassPlanState(
      planClass: planClass ?? this.planClass,
      newclass: newclass ?? this.newclass,
    );
  }

  @override
  List<Object> get props => [
        planClass.hashCode,
        newclass.hashCode,
      ];
}

class ClassPlanInitialState extends ClassPlanState {
  const ClassPlanInitialState({
    super.planClass = const [PlanClass("Letramento", Etapas(name: "Ensino Fundamental de 9° Ano - 1° Ano"),
              Diciplinas(name: "nameDiciplina"), [],)],
    super.newclass = false,
  });
}
