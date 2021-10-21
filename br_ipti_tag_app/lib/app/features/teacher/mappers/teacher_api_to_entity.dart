import 'package:br_ipti_tag_app/app/api/instructor/instructor_response.dart';
import 'package:br_ipti_tag_app/app/core/mapper/mapper.dart';
import 'package:br_ipti_tag_app/app/features/teacher/domain/entities/teacher.dart';

class TeacherApiToEntityMapper extends CoreMapper<InstructorResponse, Teacher> {
  @override
  Teacher call(InstructorResponse param) {
    return Teacher(
      name: param.name,
      email: param.email,
    );
  }
}
