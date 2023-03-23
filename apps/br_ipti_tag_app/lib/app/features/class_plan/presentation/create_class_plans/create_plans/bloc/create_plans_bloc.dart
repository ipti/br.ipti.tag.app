import 'package:br_ipti_tag_app/app/features/class_plan/presentation/bloc/class_plan_bloc.dart';
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/create_class_plans/create_plans/bloc/create_plans_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';


class CreatePlansController extends Cubit<CreatePlansState> {
  CreatePlansController() : super(const CreatePlansIntialState());

  final controller = Modular.get<ControllerPlanClass>();

  void setName(String value) => emit(
        state.copyWith(
          name: value,
        ),
      ); 

  void setDiciplina(String value) => emit(
        state.copyWith(
          diciplina: value,
        ),
      ); 

  void setEtapas(String value) => emit(
      state.copyWith(
        etapa: value,
      ),
  );

  void submit(){
    controller.loadPlanClasses(state);
  }

}