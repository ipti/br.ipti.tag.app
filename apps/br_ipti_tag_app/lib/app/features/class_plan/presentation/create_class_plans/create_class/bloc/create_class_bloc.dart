import 'package:br_ipti_tag_app/app/features/class_plan/presentation/create_class_plans/create_class/bloc/create_class_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateClassBloc extends Cubit<CreateClassState> {
  CreateClassBloc() : super(const CreateClassState(classes: [], openForm: false));

  void newClass() => emit(state.copyWith(openForm: true));
   

}