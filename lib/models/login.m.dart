/// 用户登录接口返回类型
class LoginResp {
  int ? code;
  String ? msg;
  LoginData? data;

  LoginResp({this.code, this.msg, this.data});

  LoginResp.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    msg = json["msg"];
    data = json["data"] != null ? LoginData.fromJson(json["data"]) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["code"] = code;
    json["msg"] = msg;
    json["data"] = data?.toJson();
    return json;
  }
}

class LoginData {
  int ? id;
  String ? accessToken;
  bool ? credentialsNonExpired;
  bool ? accountNonExpired;
  bool ? accountNonLocked;
  bool ? enabled;
  String ? username;
  String ? authorities;
  String ? pushKey;
  String ? password;
  Role ? role;

  LoginData ({this.id,this.accessToken, this.credentialsNonExpired, this.accountNonExpired, this.accountNonLocked,
  this.enabled, this.username, this.authorities, this.pushKey, this.password, this.role
  });
  LoginData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    accessToken = json["accessToken"] ?? '';
    credentialsNonExpired = json["credentialsNonExpired"];
    accountNonExpired = json["accountNonExpired"];
    accountNonLocked = json["accountNonLocked"];
    enabled = json["enabled"];
    username = json["username"];
    authorities = json["authorities"];
    pushKey = json["pushKey"];
    password = json["password"];
    role = json["role"] != null ? Role.fromJson(json["role"]) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["id"] = id;
    json["accessToken"] = accessToken;
    json["credentialsNonExpired"] = credentialsNonExpired;
    json["accountNonExpired"] = accountNonExpired;
    json["accountNonLocked"] = accountNonLocked;
    json["enabled"] = enabled;
    json["username"] = username;
    json["authorities"] = authorities;
    json["pushKey"] = pushKey;
    json["password"] = password;
    json["role"] = role?.toJson();
    return json;
  }
}

class Role {
  int ? id;
  String ? name;
  String ? authority;
  String ? createTime;
  String ? updateTime;

  Role({this.id, this.name, this.authority, this.createTime, this.updateTime});

  Role.fromJson(Map<String, dynamic> json){
    id = json["id"];
    name = json["name"];
    authority = json["authority"];
    createTime = json["createTime"];
    updateTime = json["updateTime"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["authority"] = authority;
    data["createTime"] = createTime;
    data["updateTime"] = updateTime;
    return data;
  }
}