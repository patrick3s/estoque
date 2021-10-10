import 'package:auth_module/src/core/domain/entity/entity.dart';
import 'package:core_module/core_module.dart';

abstract class IUsecaseUser{
  Future<Either<Failure,bool>>signIn(Map<String,dynamic> data);
  Future<Either<Failure,bool>> signUp(Map<String,dynamic> data);
  Future<Either<Failure,UserEntity>> getUserById(String id);
  Future<Either<Failure,bool>> update(Map<String,dynamic> data);
  Future<Either<Failure,bool>> recoverPassword(Map<String,dynamic> data);
}