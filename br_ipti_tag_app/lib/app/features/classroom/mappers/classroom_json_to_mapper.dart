import 'package:br_ipti_tag_app/app/core/mapper/mapper.dart';
import 'package:br_ipti_tag_app/app/features/classroom/data/model/classroom_model.dart';

class ClassroomJsonToMapMapper
    extends CoreMapper<Map<String, dynamic>, ClassroomModel> {
  @override
  ClassroomModel call(Map<String, dynamic> map) {
    return ClassroomModel(
      name: map['name'] as String,
      registerType: map['register_type'] as String,
      inepId: map['inep_id'] as String,
      hash: map['hash'] as int,
      
    );
  }
}
