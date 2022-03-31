import 'package:br_ipti_tag_app/app/features/classroom/domain/entities/instructors_entity.dart';

class InstructorModel extends InstructorEntity {
  InstructorModel({required String id, required String name, required String schoolInepId}) : 
  super(id:id, name: name, schoolInepIdFk: schoolInepId);


factory InstructorModel.fromJson(Map<String, dynamic> map){
  return InstructorModel(id: map['_id'], name: map['name'], 
  schoolInepId: map['school_inep_id_fk']);
}
}