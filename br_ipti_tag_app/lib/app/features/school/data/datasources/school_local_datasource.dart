import 'package:br_ipti_tag_app/app/core/defaults/data_source.dart';
import 'package:br_ipti_tag_app/app/features/school/data/models/school_model.dart';
import 'package:br_ipti_tag_app/app/features/school/domain/entities/school.dart';

class SchoolLocalDataSource implements DataSource<SchoolEntity, SchoolModel> {
  @override
  Future<SchoolModel> create(SchoolEntity data) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(String uuid) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<SchoolModel>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<SchoolModel> getOne(String uuid) {
    // TODO: implement getOne
    throw UnimplementedError();
  }

  @override
  Future<SchoolModel> update(String uuid, SchoolEntity data) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
