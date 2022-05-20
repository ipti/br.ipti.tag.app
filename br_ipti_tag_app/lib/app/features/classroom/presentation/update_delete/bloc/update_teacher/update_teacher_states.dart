import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/edcenso_disciplines_entity.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructors_entity.dart';
import 'package:equatable/equatable.dart';

abstract class UpdateTeacherState extends Equatable {}

class UpdateTeacherStateSuccess extends UpdateTeacherState {
  final List<InstructorEntity> instructors;
  final List<List<EdcensoDisciplinesEntity>> disciplinesOfInstructor;
  UpdateTeacherStateSuccess(this.instructors, this.disciplinesOfInstructor);
  @override
  List<Object?> get props => [instructors, disciplinesOfInstructor];
}

class UpdateTeacherStateError extends UpdateTeacherState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class UpdateTeacherStateEmpty extends UpdateTeacherState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class UpdateTeacherStateLoading extends UpdateTeacherState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
