import 'package:dio/dio.dart';
import '../models/devices.m.dart';
import '../utils/dio/request.dart' show Request;

/// 分页查询国标设备
Future<DevicesQueryResp> getDeviceQueryList(int page, int count, [String? query, bool? status]) async {
  var res = await Request.get(
    '/api/device/query/devices',
    options: Options(
      method: 'GET', responseType: ResponseType.plain,
    ),
    queryParameters: {
      "page": page,
      'count': count
    },
  );
  return DevicesQueryResp.fromJson(res);
}

/// 根据国标设备ID查询设备信息
Future<DeviceQueryByIdResp> getDeviceByDeviceId(String deviceID) async {
  var res = await Request.get(
    '/api/device/query/devices/$deviceID',
    options: Options(
      method: 'GET',
      responseType: ResponseType.plain,
    )
  );
  return DeviceQueryByIdResp.fromJson(res);
}
/// 获取通道同步进度
Future<ChannelSyncResp> getSyncStatus(String deviceID) async {
  var res = await Request.get(
      "/api/device/query/$deviceID/sync_status",
      options: Options(
        method: 'GET', responseType: ResponseType.plain,
      )
  );
  return ChannelSyncResp.fromJson(res);
}

/// 分页查询通道
Future<ChannelQueryResp> getChannelQuery(String deviceId, int page, int count, [bool? onLine]) async {
  var json = await Request.get(
    '/api/device/query/devices/$deviceId/channels',
    options: Options(
      method: 'GET',
      responseType: ResponseType.plain,
    ),
    queryParameters: {
      "page": page,
      'count': count
    },
  );
  return ChannelQueryResp.fromJson(json);
}

/// 获取通道截图
Future<Stream> getChannelSnap(String deviceId, String channelId) async {
  Response stream = await Dio().get(
    '/api/device/query/snap/$deviceId/$channelId',
      options: Options(
        method: 'GET',
        responseType: ResponseType.stream,
      )
  );
  return stream.data.stream;
}