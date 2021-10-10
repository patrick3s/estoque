import 'dart:convert';

import 'package:auth_module/src/core/data/datasource/idatasource_user.dart';
import 'package:auth_module/src/core/domain/entity/entity.dart';
import 'package:core_module/core_module.dart';

class DatasourceUser extends IDatasourceUser {
  late final Api _api;
  final _serializer = UserSerializer();
  DatasourceUser() {
    _api = Modular.get<Api>();
  }
  @override
  Future<UserEntity> getUserById(String id) async {
    final response = await _api.get('user/${int.parse(id)}',token: true);
    await _setMapUser(response);
    return _serializer.from(response);
  }

  @override
  Future<bool> signIn(Map<String, dynamic> data) async {
    final response = await _api.post('user/signin', body: json.encode(data));
    await _setMapUser(response);
    return true;
  }

  @override
  Future<bool> signUp(Map<String, dynamic> data) async {

    final response = await _api.post('/user/signup', body: json.encode(data));
    await _setMapUser(response);
    return true;
  }

  @override
  Future<bool> update(Map<String, dynamic> data) async {
     await _api.put('user/${AuthHelper.getUser!.id}',token: true,body: json.encode(data));
    await _setMapUser(data);
    return true;
  }

  _setMapUser(Map<String, dynamic> map) async {
    final _prefs = await SharedPreferences.getInstance();
    final save = await _prefs.setString('user', jsonEncode(map));
    if (!save) {
      throw Failure('Erro ao manter usuario logado');
    }
  }

  @override
  Future<bool> recoverPassword(Map<String, dynamic> data) async {
    await _api.post('user/change_password',body: jsonEncode(data));
    return true;
  }
}
