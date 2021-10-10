
import 'package:auth_module/src/core/domain/entity/entity.dart';
import 'package:auth_module/src/core/domain/repositories/irepository_user.dart';
import 'package:auth_module/src/core/domain/usecases/iusecase_user.dart';
import 'package:dartz/dartz.dart';
import 'package:commons/error/failure.dart';

class UsecaseUser extends IUsecaseUser {
  final IRepositoryUser _repository;

  UsecaseUser(this._repository);
  @override
  Future<Either<Failure, UserEntity>> getUserById(String id) async{
    return await _repository.getUserById(id);
  }

  @override
  Future<Either<Failure, bool>> signIn(Map<String, dynamic> data) async {
    return await _repository.signIn(data);
  }

  @override
  Future<Either<Failure, bool>> signUp(Map<String, dynamic> data) async {
    return await _repository.signUp(data);
  }

  @override
  Future<Either<Failure, bool>> update(Map<String, dynamic> data) async{
    return await _repository.update(data);
  }

  @override
  Future<Either<Failure, bool>> recoverPassword(Map<String, dynamic> data) async {
    return await _repository.recoverPassword(data);
  }

}