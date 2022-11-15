import 'package:tag_sdk/src/core/defaults/data_source.dart';
import 'package:tag_sdk/src/features/school/data/models/school_model.dart';
import 'package:tag_sdk/src/features/school/domain/entities/school.dart';

class SchoolLocalDataSource implements DataSource<School, SchoolModel> {
  @override
  Future<SchoolModel> create(School data) {
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(String uuid) {
    throw UnimplementedError();
  }

  @override
  Future<List<SchoolModel>> getAll() {
    throw UnimplementedError();
  }

  @override
  Future<SchoolModel> getOne(String uuid) {
    throw UnimplementedError();
  }

  @override
  Future<SchoolModel> update(String uuid, School data) {
    throw UnimplementedError();
  }
}
