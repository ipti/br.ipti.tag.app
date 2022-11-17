import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/core/api/school/get_school_endpoint.dart';
import 'package:tag_sdk/src/core/api/school/put_school_endpoint.dart';
import 'package:tag_sdk/src/core/defaults/data_source.dart';
import 'package:tag_sdk/src/features/school/domain/entities/school.dart';

class SchoolRemoteDataSource implements DataSource<School, School> {
  SchoolRemoteDataSource(
    this._httpClient,
  );

  final RouterAPI _httpClient;

  @override
  Future<School> create(School data) {
    throw UnimplementedError();
  }

  @override
  Future<List<School>> getAll() {
    throw UnimplementedError();
  }

  @override
  Future<School> getOne(String uuid) async {
    final response = await _httpClient.request(
      route: GetSchoolEndPoint(uuid),
    );

    final data = School.fromJson(response.data!);

    return data;
  }

  @override
  Future<School> update(String uuid, School schoolDto) async {
    final response = await _httpClient.request(
      route: PutSchoolEndPoint(uuid, schoolDto),
    );
    final data = School.fromJson(response.data!);

    return data;
  }

  @override
  Future<bool> delete(String uuid) {
    throw UnimplementedError();
  }
}
