import 'dart:ffi';

class NewVersionRes {
  String? code;
  String? message;
  NewVersionData? data;

  NewVersionRes({this.code, this.message, this.data});

  NewVersionRes.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? NewVersionData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class NewVersionData {
  late String version;
  late List<String> info;

  NewVersionData({required this.version, required this.info});

  NewVersionData.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    info = json['info'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['info'] = info;
    return data;
  }
}


class SystemInfoResp {
  int? code;
  String? msg;
  SystemInfoData? data;

  SystemInfoResp.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? SystemInfoData.fromJson(json['data']) : null;
  }
}

class SystemInfoData {
  int? netTotal;
  List<CpuInfo?>? cpu;
  List<DiskInfo?>? disk;
  List<MemInfo?>? mem;
  List<NetInfo?>? net;

  SystemInfoData.fromJson(Map<String, dynamic> json) {
    netTotal = json['netTotal'];
    if (json['cpu'] != null) {
      cpu = <CpuInfo>[];
      json['cpu'].forEach((v) { cpu!.add(CpuInfo.fromJson(v)); });
    }
    if (json['mem'] != null) {
      mem = <MemInfo>[];
      json['mem'].forEach((v) { mem!.add(MemInfo.fromJson(v)); });
    }
    if (json['net'] != null) {
      net = <NetInfo>[];
      json['net'].forEach((v) { net!.add(NetInfo.fromJson(v)); });
    }
    if (json['disk'] != null) {
      disk = <DiskInfo>[];
      json['disk'].forEach((v) { disk!.add(DiskInfo.fromJson(v)); });
    }
  }
}

class CpuInfo {
  double? data;
  double? time;

  CpuInfo({double this.data = 0, double this.time = 0});

  CpuInfo.fromJson(Map<String, dynamic> json) {
    data = double.parse(json["data"]);
    time = DateTime.parse(json["time"]).millisecondsSinceEpoch.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["data"] = data;
    data["time"] = time;
    return data;
  }
}
class DiskInfo {
  String? path;
  double? use;
  double? free;

  DiskInfo({this.path, this.use, this.free});

  DiskInfo.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    use = json['use'];
    free = json['free'];
  }
}

class MemInfo {
  String? data;
  String? time;

  MemInfo({this.data, this.time});

  MemInfo.fromJson(Map<String, dynamic> json) {
    data = json["data"];
    time = json["time"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["data"] = data;
    data["time"] = time;
    return data;
  }
}

class NetInfo {
  String? time;
  double? up;
  double? down;

  NetInfo({this.time, this.up, this.down});

  NetInfo.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    up = json['in'];
    down = json['out'];
  }
}

class ResourceInfoResp {
  int? code;
  String? msg;
  ResourceData? data;

  ResourceInfoResp({this.code, this.msg, this.data});

  ResourceInfoResp.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? ResourceData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ResourceData {
  Device? device;
  Device? channel;
  Device? push;
  Device? proxy;

  ResourceData({this.device, this.channel, this.push, this.proxy});

  ResourceData.fromJson(Map<String, dynamic> json) {
    device =
    json['device'] != null ? new Device.fromJson(json['device']) : null;
    channel =
    json['channel'] != null ? new Device.fromJson(json['channel']) : null;
    push = json['push'] != null ? new Device.fromJson(json['push']) : null;
    proxy = json['proxy'] != null ? new Device.fromJson(json['proxy']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (device != null) {
      data['device'] = device!.toJson();
    }
    if (channel != null) {
      data['channel'] = channel!.toJson();
    }
    if (push != null) {
      data['push'] = push!.toJson();
    }
    if (proxy != null) {
      data['proxy'] = proxy!.toJson();
    }
    return data;
  }
}

class Device {
  int? total;
  int? online;

  Device({int this.total = 0, int this.online = 0});

  Device.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    online = json['online'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['online'] = online;
    return data;
  }
}
