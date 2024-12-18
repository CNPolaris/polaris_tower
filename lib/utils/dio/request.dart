import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:polaris_tower/utils/index.dart';
import '../../config/app_config.dart';
import 'interceptors/header_interceptor.dart';
import 'interceptors/log_interceptor.dart';

Dio _initDio() {
  BaseOptions baseOpts = BaseOptions(
    baseUrl: AppConfig.host,
    receiveDataWhenStatusError: true,
  );
  Dio dioClient = Dio(baseOpts); // 实例化请求，可以传入options参数
  dioClient.interceptors.addAll([
    HeaderInterceptors(),
    LogsInterceptors(),
  ]);

  if (AppConfig.usingProxy) {
    dioClient.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.findProxy = (uri) {
          // 设置Http代理，请注意，代理会在你正在运行应用的设备上生效，而不是在宿主平台生效。
          return "PROXY ${AppConfig.proxyAddress}";
        };
        // https证书校验
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );
  }
  return dioClient;
}

Future<T> safeRequest<T>(
  String url, {
  Object? data,
  Options? options,
  Map<String, dynamic>? queryParameters,
  CancelToken? cancelToken,
}) async {
  try {
    return Request.dioClient
        .request(
          url,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        )
        .then((data) => jsonDecode(data.data as String) as T);
  } catch (e) {
    LogUtil.d(e);
    rethrow;
  }
}

class Request {
  static Dio dioClient = _initDio();

  /// get请求
  static Future<T> get<T>(
    String url, {
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    return safeRequest<T>(
      url,
      options: options,
      queryParameters: queryParameters,
    );
  }

  /// post请求
  static Future<T> post<T>(
    String url, {
    Options? options,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return safeRequest<T>(
      url,
      options: options?.copyWith(method: 'POST') ?? Options(method: 'POST'),
      data: data,
      queryParameters: queryParameters,
    );
  }

  /// put请求
  static Future<T> put<T>(
    String url, {
    Options? options,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return safeRequest<T>(
      url,
      options: options?.copyWith(method: 'PUT') ?? Options(method: 'PUT'),
      data: data,
      queryParameters: queryParameters,
    );
  }
}
