import 'package:tag_sdk/src/core/defaults/data_source.dart';
import 'package:tag_sdk/src/features/school/domain/entities/school.dart';

class SchoolLocalDataSource implements DataSource<School, School> {
  @override
  Future<School> create(School data) {
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(String uuid) {
    throw UnimplementedError();
  }

  @override
  Future<List<School>> getAll() {
    throw UnimplementedError();
  }

  @override
  Future<School> getOne(String uuid) {
    throw UnimplementedError();
  }

  @override
  Future<School> update(String uuid, School data) {
    throw UnimplementedError();
  }
}
