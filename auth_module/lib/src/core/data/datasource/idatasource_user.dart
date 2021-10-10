import 'package:auth_module/src/core/domain/entity/entity.dart';

abstract class IDatasourceUser {
  Future<bool>signIn(Map<String,dynamic> data);
  Future<bool> signUp(Map<String,dynamic> data);
  Future<UserEntity> getUserById(String id);
  Future<bool> update(Map<String,dynamic> data);
  Future<bool> recoverPassword(Map<String,dynamic> data);
}