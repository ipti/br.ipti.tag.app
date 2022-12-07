import 'package:equatable/equatable.dart';
import 'package:tag_sdk/tag_sdk.dart';

abstract class UpdateTeacherState extends Equatable {}

class UpdateTeacherStateSuccess extends UpdateTeacherState {
  final List<Instructor> instructors;
  final List<List<EdcensoDiscipline>> disciplinesOfInstructor;
  final List<InstructorTeachingDataEntity> instructorsTeachingData;
  UpdateTeacherStateSuccess(
    this.instructors,
    this.disciplinesOfInstructor,
    this.instructorsTeachingData,
  );
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
