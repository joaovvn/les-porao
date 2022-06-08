import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json, base64, ascii;

import 'package:jwt_decoder/jwt_decoder.dart';

String baseUrl = 'https://les-porao.herokuapp.com/';

Future<int?> cadastro(
    {required String nome,
    required String email,
    required String senha,
    required bool isCompany}) async {
  Dio dio = Dio();
  dio.options.headers['content-type'] = 'application/json';
  dio.options.headers['Access-Control-Allow-Credentials'] = true;
  dio.options.headers['Access-Control-Allow-Origin'] = '*';
  dio.options.headers['Access-Control-Allow-Headers'] =
      'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale';
  dio.options.headers['Access-Control-Allow-Methods'] = 'POST, OPTIONS';
  try {
    Response response = await dio.post(baseUrl + 'user/cadastro', data: {
      'name': nome,
      'password': senha,
      'email': email,
      'iscompany': isCompany
    });
    print(response);
    return response.statusCode;
  } on DioError catch (e) {
    print(e);
    return 0;
  }
}

Future<Map?> login({required String email, required String senha}) async {
  Dio dio = Dio();
  dio.options.headers['content-type'] = 'application/json';
  dio.options.headers['Access-Control-Allow-Credentials'] = true;
  dio.options.headers['Access-Control-Allow-Origin'] = '*';
  dio.options.headers['Access-Control-Allow-Headers'] =
      'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale';
  dio.options.headers['Access-Control-Allow-Methods'] = 'POST, OPTIONS';
  try {
    Response response = await dio.post(baseUrl + 'user/login',
        data: {'password': senha, 'email': email});
    print(JwtDecoder.decode(response.data['content']));
    return JwtDecoder.decode(response.data['content']);
  } on DioError catch (e) {
    print(e);
    return null;
  }
}

Future<Map?> getList() async {
  Dio dio = Dio();
  dio.options.headers['content-type'] = 'application/json';
  dio.options.headers['Access-Control-Allow-Credentials'] = true;
  dio.options.headers['Access-Control-Allow-Origin'] = '*';
  dio.options.headers['Access-Control-Allow-Headers'] =
      'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale';
  dio.options.headers['Access-Control-Allow-Methods'] = 'GET';
  try {
    Response response = await dio.get(baseUrl + 'vaga/list');
    print(response.data);
    return response.data;
  } on DioError catch (e) {
    print(e);
    return null;
  }
}

getConversion() async {
  var headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
  final response = await http.get(
      Uri.parse(
          'https://api.hgbrasil.com/finance?format=json-cors&key=0e95baf2'),
      headers: headers);
  return jsonDecode(response.body);
}
