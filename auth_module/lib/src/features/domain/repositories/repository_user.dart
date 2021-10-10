import 'package:auth_module/src/core/data/datasource/idatasource_user.dart';
import 'package:auth_module/src/core/domain/entity/entity.dart';
import 'package:auth_module/src/core/domain/repositories/irepository_user.dart';
import 'package:dartz/dartz.dart';
import 'package:commons/error/failure.dart';

class RepositoryUser extends IRepositoryUser {
  final IDatasourceUser _datasource;

  RepositoryUser(this._datasource);
  @override
  Future<Either<Failure, UserEntity>> getUserById(String id)async {
    try{
      return Right(await _datasource.getUserById(id));
    }on Failure catch(e){
      return Left(e);
    }catch(e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> signIn(Map<String, dynamic> data) async{
    try{
      return Right(await _datasource.signIn(data));
    }on Failure catch(e){
      return Left(e);
    }catch(e){
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> signUp(Map<String, dynamic> data) async{
    try{
      return Right(await _datasource.signUp(data));
    }on Failure catch(e){
      return Left(e);
    }catch(e){
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> update(Map<String, dynamic> data) async {
    try{
      return Right(await _datasource.update(data));
    }on Failure catch(e){
      return Left(e);
    }catch(e){
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> recoverPassword(Map<String, dynamic> data) async{
     try{
      return Right(await _datasource.recoverPassword(data));
    }on Failure catch(e){
      return Left(e);
    }catch(e){
      return Left(Failure(e.toString()));
    }
  }

}