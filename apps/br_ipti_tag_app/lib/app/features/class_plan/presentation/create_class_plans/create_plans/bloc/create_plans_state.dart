import 'package:br_ipti_tag_app/app/features/class_plan/presentation/bloc/class_plan_bloc.dart';
import 'package:equatable/equatable.dart';

class CreatePlansState extends Equatable {
  const CreatePlansState({
    required this.name,
    required this.etapa,
    required this.diciplina,
  });

  final String name;
  final Etapas etapa;
  final Diciplinas diciplina;

  CreatePlansState copyWith({
    String? name,
    Etapas? etapa,
    Diciplinas? diciplina,
  }) {
    return CreatePlansState(
      name: name ?? this.name,
      etapa: etapa ?? this.etapa,
      diciplina: diciplina ?? this.diciplina,
    );
  }

  @override
  List<Object> get props => [name, etapa, diciplina];
}