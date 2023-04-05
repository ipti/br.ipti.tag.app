// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:br_ipti_tag_app/app/features/class_plan/presentation/bloc/class_plan_bloc.dart';
import 'package:equatable/equatable.dart';

class CreateClassState extends Equatable {
  const CreateClassState({
    required this.classes,
  });

  final List<Classes> classes;

  CreateClassState copyWith({
    List<Classes>? classes,
    bool? openForm,
  }) {
    return CreateClassState(
      classes: classes ?? this.classes,
    );
  }

  @override
  List<Object> get props => [classes.hashCode];
}

class CreatePlansIntialState extends CreateClassState {
  const CreatePlansIntialState() : super(classes: const []);
}

class Classes {
    Classes({
    required this.ability,
    required this.object,
    required this.types,
    required this.resource,
    this.isExpanded = false,
  });

    List<Ability> ability;
    String object;
    String types;
    String resource;
    bool isExpanded;
}

class Ability {
  final String ability;

  Ability(this.ability);
}
