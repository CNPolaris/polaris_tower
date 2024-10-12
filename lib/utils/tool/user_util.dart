import '../../models/login.m.dart';
import './sp_util.dart';

const userInfoKey = 'userInfoKey';

class UserUtil {
  /// 获取缓存用户信息
  static Future<LoginData> getUserInfo() async {
    var cacheData = await SpUtil.getMap(userInfoKey, defValue: {});
    return LoginData.fromJson(cacheData.cast<String, dynamic>());
  }

  /// 保存用户信息
  static Future<void> saveUserInfo(LoginData data) async {
    // data.avatar = data.avatar?.replaceAll(RegExp(r'http://'), 'https://');
    SpUtil.setMapData(userInfoKey, data.toJson());
  }

  /// 清除用户信息缓存
  static Future<void> cleanUserInfo() async {
    SpUtil.remove(userInfoKey);
  }

  /// 获取token
  static Future<String> getToken() async {
    var userInfo = await getUserInfo();
    return userInfo.accessToken ?? '';
  }

  /// 设置token
  static Future<void> setToken(String value) async {
    var userInfo = await getUserInfo();
    userInfo.accessToken = value;
    saveUserInfo(userInfo);
  }

  /// 清除token
  static Future<void> cleanToKen() async {
    var userInfo = await getUserInfo();
    userInfo.accessToken = '';
    saveUserInfo(userInfo);
  }
}
