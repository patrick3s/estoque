import 'dart:convert';

import 'package:auth_module/src/features/data/model/user_model.dart';
import 'package:auth_module/src/features/data/serializer/user_serializer.dart';
import 'package:dependency_module/dependency_module.dart';

class AuthHelper {
  static UserModel? _user;
  static const _userKey = 'user';
  static final _serializer = UserSerializer();

  static void logout()async{
    final _prefs = await SharedPreferences.getInstance();
    _prefs.remove(_userKey);
  }

  static Future<bool> isLogged()async{
    await _currentUser();
    return _user != null;
  }

  static UserModel? get getUser => _user;

  static _currentUser() async {
    final _prefs = await SharedPreferences.getInstance();
    final mapUserEncode = _prefs.getString(_userKey);
    if(mapUserEncode == null) return null;
    _user = _serializer.from(jsonDecode(mapUserEncode));
  }
}
