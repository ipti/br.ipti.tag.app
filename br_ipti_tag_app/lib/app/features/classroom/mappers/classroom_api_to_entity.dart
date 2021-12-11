import 'package:br_ipti_tag_app/app/core/mapper/mapper.dart';
import 'package:br_ipti_tag_app/app/features/classroom/data/model/classroom_model.dart';
import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/classroom.dart';

class ClassroomApiToEntityMapper extends CoreMapper<ClassroomModel, Classroom> {
  @override
  Classroom call(ClassroomModel param) {
    return Classroom(
      name: param.name,
      endTime: '${param.finalHour}:${param.finalMinute}',
      modalityId: param.modality,
      stageId: param.hash,
      startTime: '${param.initialHour}:${param.initialMinute}',
    );
  }
}
