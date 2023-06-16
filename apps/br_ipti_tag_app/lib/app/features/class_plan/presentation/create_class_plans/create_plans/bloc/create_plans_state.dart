import 'package:br_ipti_tag_app/app/features/class_plan/presentation/bloc/class_plan_bloc.dart';
import 'package:equatable/equatable.dart';

class CreatePlansState extends Equatable {
  const CreatePlansState({
    required this.name,
    required this.etapa,
    required this.diciplina,
  });

  final String name;
  final String etapa;
  final String diciplina;

  CreatePlansState copyWith({
    String? name,
    String? etapa,
    String? diciplina,
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

class CreatePlansIntialState extends CreatePlansState {
  const CreatePlansIntialState() : super(diciplina: "", etapa: "", name: "");

}