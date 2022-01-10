import 'package:br_ipti_tag_app/app/core/mapper/mapper.dart';
import 'package:br_ipti_tag_app/app/features/student/data/models/student_model.dart';
import 'package:br_ipti_tag_app/app/features/student/domain/entities/student.dart';

class StudentApiToEntityMapper extends CoreMapper<StudentModel, Student> {
  @override
  Student call(StudentModel model) {
    return Student(
      id: model.id,
      name: model.name ?? "",
      deficiency: model.deficiency ?? false,
    );
  }
}
