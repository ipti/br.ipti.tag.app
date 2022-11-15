abstract class DataSource<E, M> {
  Future<M> create(E data) async {
    // TODO: implement getOne
    throw UnimplementedError();
  }

  Future<List<M>> getAll() async {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  Future<M> getOne(String uuid) async {
    // TODO: implement getOne
    throw UnimplementedError();
  }

  Future<M> update(String uuid, E data) async {
    // TODO: implement getOne
    throw UnimplementedError();
  }

  Future<bool> delete(String uuid) async {
    // TODO: implement getOne
    throw UnimplementedError();
  }
}
