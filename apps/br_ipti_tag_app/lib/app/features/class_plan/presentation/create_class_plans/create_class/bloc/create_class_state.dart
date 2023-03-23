// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/bloc/class_plan_bloc.dart';
import 'package:equatable/equatable.dart';

class CreateClassState extends Equatable {
   const CreateClassState({
    required this.classes,
    required this.openForm,
  });
  
   final bool openForm;
  final List<Classes> classes;
 

  CreateClassState copyWith({
    List<Classes>? classes,
    bool? openForm,
    
  }) {
    return CreateClassState(
      classes: classes ?? this.classes,
      openForm: openForm ?? this.openForm,
    );
  }

  @override
  List<Object> get props => [classes];
}

class CreatePlansIntialState extends CreateClassState {
  const CreatePlansIntialState() : super(classes: const [], openForm: false);
}

class Classes {
   const Classes({
    required this.name,
    required this.etapa,
    required this.diciplina,
  });

  final String name;
  final String etapa;
  final String diciplina;

}