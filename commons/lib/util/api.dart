// ignore_for_file: unused_element

import 'dart:convert';

import 'package:commons/commons.dart';
import 'package:commons/util/env.dart';
import 'package:http/http.dart' as http;

class Api {
  final _url = EnvApp.baseApi;

  static final _headers = {
    "Content-Type":"Application/json",
  "env": EnvApp.suffixName.replaceAll('.', '')};
  Future<dynamic> post(String url,
      {Map<String, String>? headers ,
      Object? body,
      Encoding? encoding,
      bool? token}) async {
      headers = {};
    headers.addAll(_headers);
    if (token == true) {
      headers['Authorization']= await _insertTokenInHeaders();
    }
    final response = await http.post(Uri.parse(_url + url),
        headers: headers, body: body, encoding: encoding);
    final data = _hasData(response);
    return data;
  }

  Future<dynamic> get(String url,{Map<String,String>? headers  , bool? token}) async {
    headers = {};
    if(token == true){
      headers['Authorization']= await _insertTokenInHeaders();
    }
    headers.addAll(_headers);
    final url_ = Uri.parse(_url + url);
    final response = await http.get(url_,
    headers: headers
    );
    final data = _hasData(response);
    return data;
  }

  Future<dynamic> put(String url,
      {Map<String, String>? headers ,
      Object? body,
      Encoding? encoding,
      bool? token}) async {
        headers = {};
    headers.addAll(_headers);
    if (token == true) {
      headers['Authorization']= await _insertTokenInHeaders();
    }
    final response = await http.put(Uri.parse(_url + url),
        headers: headers, body: body, encoding: encoding);
    final data = _hasData(response);
    return data;
  }

  Future<dynamic> delete(String url,
      {Map<String, String>? headers ,
      Object? body,
      Encoding? encoding,
      bool? token}) async {
        headers = {};
   headers.addAll(_headers);
    if (token == true) {
      headers['Authorization']= await _insertTokenInHeaders();
    }
    final response = await http.delete(Uri.parse(_url + url),
        headers: headers, body: body, encoding: encoding);
    final data = _hasData(response);
    return data;
  }


  Future<String?> _generateToken() async {
    final user = await AuthHelper.currentUser;
    if (user == null) return null;
    final Map<String,String>headers = {};
    headers.addAll(_headers);
    final url = Uri.parse(_url + 'Token/');

    final response = await http.post(url,
        body: jsonEncode({
          UserKeys.id: user[UserKeys.id],
          UserKeys.createAt: user[UserKeys.createAt]
        }),
        headers: headers);
           
    Map<String, dynamic> map = {};
    if (response.statusCode == 200 || response.statusCode == 201) {
        map.addAll(jsonDecode(response.body));
      return "Bearer ${map['token']}";
    }

    if (response.body.contains('response')) {
      map.addAll(jsonDecode(response.body));
      return map['response'];
    }
    return null;
  }

  dynamic _hasData(http.Response response) {
    Map<String, dynamic> map = {};
   
    if (response.statusCode == 200 || response.statusCode == 201) {
      map.addAll(jsonDecode(response.body));
      return map['response'];
    } else if (response.body.contains('response')) {
      map.addAll(jsonDecode(response.body));
      throw Failure(map['response']);
    } else {
      throw Failure("Erro desconhecido ao fazer requisição");
    }
  }

  Future<String> _insertTokenInHeaders(
    ) async {
    final _token = await _generateToken();

    if (_token?.trim().contains('Bearer ') == true) {
    
      return  _token!;
    } else if (_token != null) {
      throw Failure(_token);
    } else {
      throw Exception('Erro desconhecido ao recuperar token');
    }

  }
}
