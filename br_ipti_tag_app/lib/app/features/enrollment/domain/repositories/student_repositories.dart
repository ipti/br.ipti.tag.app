import 'package:dartz/dartz.dart';

import '../../domain/entities/student.dart';
import '../../domain/usecases/fast_enrollment_usecase.dart';

class StudentService implements IStudentService {
  final IStudentRepository _repository;

  StudentService(this._repository);

  @override
  Future<Either<Exception, List<Student>>> listAll() async {
    try {
      final results = await _repository.listAll();
      return Right(results);
    } catch (e) {
      return Left(Exception("Não foi possível listar"));
    }
  }

  @override
  Future<Either<Exception, Student>> getById(int id) async {
    try {
      final results = await _repository.getById(id);
      return Right(results);
    } catch (e) {
      return Left(Exception("Não foi possível listar"));
    }
  }

  @override
  Future<Either<Exception, bool>> create(Student student) async {
    try {
      final results = await _repository.create(student);
      return Right(results);
    } catch (e) {
      return Left(Exception("Não foi possível adicionar estudantes"));
    }
  }
}

abstract class IStudentRepository {
  Future<List<Student>> listAll();
  Future<Student> getById(int id);
  Future<bool> create(Student student);
}
