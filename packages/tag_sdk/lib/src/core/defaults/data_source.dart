abstract class DataSource<E, M> {
  Future<M> create(E data) async {
    throw UnimplementedError();
  }

  Future<List<M>> getAll() async {
    throw UnimplementedError();
  }

  Future<M> getOne(String uuid) async {
    throw UnimplementedError();
  }

  Future<M> update(String uuid, E data) async {
    throw UnimplementedError();
  }

  Future<bool> delete(String uuid) async {
    throw UnimplementedError();
  }
}
