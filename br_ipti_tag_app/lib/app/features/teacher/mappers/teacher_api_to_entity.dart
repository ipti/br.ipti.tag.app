import 'package:br_ipti_tag_app/app/core/defaults/mapper.dart';
import 'package:br_ipti_tag_app/app/features/teacher/data/models/instructor_model.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/teacher.dart';

class TeacherApiToEntityMapper extends CoreMapper<InstructorModel, Teacher> {
  @override
  Teacher call(InstructorModel param) {
    return Teacher(
      name: param.name,
      email: param.email,
    );
  }
}
