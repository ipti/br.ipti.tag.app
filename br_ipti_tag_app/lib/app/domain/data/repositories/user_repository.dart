import '../entities/user.dart';

class UserRepository {
  Future<List<User>> listAll() {
    return Future.delayed(Duration(milliseconds: 500)).then((value) => [
          User(1, '2512245', '555'),
          User(1, '5215145', '555'),
          User(1, '2512245', '555'),
          User(1, '2512245', '555'),
        ]);
  }
}
