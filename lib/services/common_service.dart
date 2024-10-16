import 'package:dio/dio.dart';

import '../models/common.m.dart';

import '../utils/dio/request.dart' show Request;


/// 获取APP最新版本号, 演示更新APP组件
Future<NewVersionData> getNewVersion() async {
  // TODO: 替换为你的真实请求接口，并返回数据，此处演示直接返回数据
  // var res = await Request.get(
  //   '/api',
  //   queryParameters: {'key': 'value'},
  // ).catchError((e) => resData);
  var resData = NewVersionRes.fromJson({
    "code": "0",
    "message": "success",
    "data": {
      "version": "2.2.4",
      "info": ["修复bug提升性能", "增加彩蛋有趣的功能页面", "测试功能"]
    }
  });
  return (resData.data ?? {}) as NewVersionData;
}

Future<SystemInfoResp> getSystemInfo() async {
  var res = await Request.get(
    '/api/server/system/info',
    options: Options(
        method: 'GET', responseType: ResponseType.plain,
    ),
  );
  return SystemInfoResp.fromJson(res);
}

Future<ResourceInfoResp> getResourceInfo() async {
  var res = await Request.get(
    '/api/server/resource/info',
    options: Options(
      method: 'GET', responseType: ResponseType.plain,
    ),
  );
  return ResourceInfoResp.fromJson(res);
}