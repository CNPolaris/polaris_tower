import 'package:dio/dio.dart';

import '../models/login.m.dart';

import '../utils/dio/request.dart' show Request;

Future<LoginResp> login() async{
  var res = await Request.get(
    '/api/user/login',
    options: Options(method: 'GET', responseType: ResponseType.plain),
    queryParameters: {
      "username": "admin",
      'password': "07abdbd30ef8b6a39c8edaf351822f9e"
    },
  );
  return LoginResp.fromJson(res);
}