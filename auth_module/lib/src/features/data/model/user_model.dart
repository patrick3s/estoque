// ignore_for_file: overridden_fields, annotate_overrides

import 'package:auth_module/src/core/domain/entity/entity.dart';

class UserModel extends UserEntity {
  final String id;
  final String name;
  final String email;
  final DateTime createAt;

  UserModel({
    required this.id, 
    required this.name, 
    required this.email, 
    required this.createAt})
  :super(id, name, email, createAt);
}