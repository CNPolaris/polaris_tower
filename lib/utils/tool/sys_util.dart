import './sp_util.dart';
import '../../models/common.m.dart';

const systemInfoKey = 'systemInfoKey';

class SysConfigUtil {

  static Future<SystemInfoConfig> getSystemInfo() async {
    var cacheData = await SpUtil.getMap(systemInfoKey, defValue: {});
    return SystemInfoConfig.fromJson(cacheData.cast<String, dynamic>());
  }
  static Future<void> saveSystemInfo(SystemInfoConfig data) async {
    SpUtil.setMapData(systemInfoKey, data.toJson());
  }

  static Future<String> getSystemHost() async {
    var sysInfo = await getSystemInfo();
    return sysInfo.host ?? '';
  }

  static Future<void> setSystemHost(String host) async {
    var sysInfo = await getSystemInfo();
    sysInfo.host = host;
    saveSystemInfo(sysInfo);
  }

  static Future<void> setSystemPort(int port) async {
    var sysInfo = await getSystemInfo();
    sysInfo.port = port;
    saveSystemInfo(sysInfo);
  }

  static Future<int> getSystemPort() async {
    var sysInfo = await getSystemInfo();
    return sysInfo.port ?? 18978;
  }

  static Future<void> clearSystemConfig() async {
    SpUtil.remove(systemInfoKey);
  }
}