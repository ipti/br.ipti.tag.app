import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_network/tag_network.dart';
import 'package:tag_sdk/tag_sdk.dart';

class StudentSDKModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory(
      (i) => StudentRemoteDataSource(
        i.get<RouterAPI>(),
      ),
      export: true,
    ),
    Bind.factory(
      (i) => StudentDocumentsAndAddressRemoteDataSource(
        i.get<RouterAPI>(),
      ),
      export: true,
    ),
    Bind.factory(
      (i) => StudentEnrollmenrRemoteDataSource(
        i.get<RouterAPI>(),
      ),
      export: true,
    ),
    // repositories
    Bind.factory(
      (i) => StudentRepositoryImpl(
        i.get<StudentRemoteDataSource>(),
      ),
      export: true,
    ),
    Bind.factory(
      (i) => StudentDocumentsAddressRepositoryImpl(
        i.get<StudentDocumentsAndAddressRemoteDataSource>(),
      ),
      export: true,
    ),
    Bind.factory(
      (i) => StudentEnrollmentRepositoryImpl(
        i.get<StudentEnrollmenrRemoteDataSource>(),
      ),
      export: true,
    ),

  ];
}
