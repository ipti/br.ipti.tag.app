import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/src/core/api/school/get_school_endpoint.dart';
import 'package:tag_sdk/src/core/api/school/put_school_endpoint.dart';
import 'package:tag_sdk/src/core/defaults/data_source.dart';
import 'package:tag_sdk/src/features/school/data/models/school_model.dart';

import 'package:tag_sdk/src/features/school/domain/entities/school.dart';

class SchoolRemoteDataSource implements DataSource<School, SchoolModel> {
  SchoolRemoteDataSource(
    this._httpClient,
  );

  final RouterAPI _httpClient;

  @override
  Future<SchoolModel> create(School data) {
    throw UnimplementedError();
  }

  @override
  Future<List<SchoolModel>> getAll() {
    throw UnimplementedError();
  }

  @override
  Future<SchoolModel> getOne(String uuid) async {
    final response = await _httpClient.request(
      route: GetSchoolEndPoint(uuid),
    );

    final data = SchoolModel.fromMap(response.data!);

    return data;
  }

  @override
  Future<SchoolModel> update(String uuid, School schoolDto) async {
    final response = await _httpClient.request(
      route: PutSchoolEndPoint(uuid, schoolDto),
    );
    final data = SchoolModel.fromMap(response.data!);

    return data;
  }

  @override
  Future<bool> delete(String uuid) {
    throw UnimplementedError();
  }
}
