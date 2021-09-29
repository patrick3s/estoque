import 'package:auth_module/src/core/data/keys_models/user_keys.dart';
import 'package:auth_module/src/core/data/serializer/serializer.dart';
import 'package:auth_module/src/features/data/model/user_model.dart';

class UserSerializer extends Serializer<UserModel,Map<String,dynamic>> {
  @override
  UserModel from(Map<String, dynamic> data) {
    return UserModel(
      id: data[UserKeys.id],
      name:data[UserKeys.name], 
      email: data[UserKeys.email], 
      createAt: DateTime.fromMillisecondsSinceEpoch(data[UserKeys.createAt]));
  }

  @override
  Map<String, dynamic> to(UserModel data) {
   return {
     UserKeys.id: data.id,
     UserKeys.name:data.name,
     UserKeys.createAt: data.createAt.millisecondsSinceEpoch,
     UserKeys.email: data.email
   };
  }
}