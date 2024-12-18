import 'package:dio/dio.dart';
import 'package:polaris_tower/config/app_config.dart';
import '../../tool/event_bus.dart';
import '../../tool/user_util.dart';

/*
 * header拦截器
 */
class HeaderInterceptors extends InterceptorsWrapper {
  // 请求拦截
  @override
  onRequest(RequestOptions options, handler) async {
    options.baseUrl = AppConfig.host;
    if(UserUtil.getToken().toString().isNotEmpty) {
      options.headers['Access-token'] = UserUtil.getToken().toString();
    }
    return handler.next(options);
  }

  // 响应拦截
  @override
  onResponse(response, handler) {
    // Do something with response data
    return handler.next(response); // continue
  }

  // 请求失败拦截
  @override
  onError(err, handler) async {
    super.onError(err, handler);
    int ? errCode = err.response?.statusCode;
    if (errCode == 401) {
      // 触发登出事件
      EventBus.instance.commit(EventKeys.logout);
    }
  }
}
