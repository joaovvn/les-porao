import 'dart:convert';

import 'package:dio/dio.dart';

String baseUrl = 'https://lesporao.herokuapp.com/';

Future<int?> cadastro(
    {required String nome,
    required String email,
    required String senha}) async {
  Dio dio = Dio();
  dio.options.headers['content-type'] = 'application/json';
  dio.options.headers['Access-Control-Allow-Credentials'] = true;
  dio.options.headers['Access-Control-Allow-Origin'] = '*';
  dio.options.headers['Access-Control-Allow-Headers'] =
      'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale';
  dio.options.headers['Access-Control-Allow-Methods'] = 'POST, OPTIONS';
  try {
    Response response = await dio.post(baseUrl + 'user/cadastro',
        data: {'name': nome, 'password': senha, 'email': email});
    print(response);
    return response.statusCode;
  } on DioError catch (e) {
    print(e);
    return 0;
  }
}

Future<int?> login({required String email, required String senha}) async {
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
    print(response.data);
    return response.statusCode;
  } on DioError catch (e) {
    print(e);
    return 0;
  }
}

getConversion() async {
  Dio dio = Dio();
  try {
    Response response =
        await dio.get('https://api.hgbrasil.com/finance/?format=json-cors');
    return jsonDecode(response.toString());
  } on DioError catch (e) {
    return e.toString();
  }
}
