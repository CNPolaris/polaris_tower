// 国标设备列表
class DevicesQueryResp {
  int? code;
  String? msg;
  DevicesListDto? data;

  DevicesQueryResp.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? DevicesListDto.fromJson(json['data']) : null;
  }
}
// 国标设备详情
class DeviceQueryByIdResp {
  int? code;
  String? msg;
  DevicesInfoDto? data;

  DeviceQueryByIdResp.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? DevicesInfoDto.fromJson(json['data']) : null;
  }
}
// 通道同步进度
class ChannelSyncResp {
  int? code;
  String? msg;
  SyncProcess? data;

  ChannelSyncResp.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? SyncProcess.fromJson(json['data']) : null;
  }
}

class DevicesListDto {
  int? total;
  List<DevicesInfoDto?>? list;
  int? pageNum;
  int? pageSize;
  int? size;
  int? startRow;
  int? endRow;
  int? pages;
  int? prePage;
  int? nextPage;
  bool? isFirstPage;
  bool? isLastPage;
  bool? hasPreviousPage;
  bool? hasNextPage;
  int? navigatePages;
  List<int>? navigatepageNums;
  int? navigateFirstPage;
  int? navigateLastPage;

  DevicesListDto(
      {this.total,
        this.list,
        this.pageNum,
        this.pageSize,
        this.size,
        this.startRow,
        this.endRow,
        this.pages,
        this.prePage,
        this.nextPage,
        this.isFirstPage,
        this.isLastPage,
        this.hasPreviousPage,
        this.hasNextPage,
        this.navigatePages,
        this.navigatepageNums,
        this.navigateFirstPage,
        this.navigateLastPage});

  DevicesListDto.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['list'] != null) {
      list = <DevicesInfoDto>[];
      json['list'].forEach((v) {
        list!.add(DevicesInfoDto.fromJson(v));
      });
    }
    pageNum = json['pageNum'];
    pageSize = json['pageSize'];
    size = json['size'];
    startRow = json['startRow'];
    endRow = json['endRow'];
    pages = json['pages'];
    prePage = json['prePage'];
    nextPage = json['nextPage'];
    isFirstPage = json['isFirstPage'];
    isLastPage = json['isLastPage'];
    hasPreviousPage = json['hasPreviousPage'];
    hasNextPage = json['hasNextPage'];
    navigatePages = json['navigatePages'];
    if (json['navigatepageNums'] != null) {
      navigatepageNums = <int>[];
      json['navigatepageNums'].forEach((v) {
        navigatepageNums!.add(v as int);
      });
    }
    navigateFirstPage = json['navigateFirstPage'];
    navigateLastPage = json['navigateLastPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v?.toJson()).toList();
    }
    data['pageNum'] = this.pageNum;
    data['pageSize'] = this.pageSize;
    data['size'] = this.size;
    data['startRow'] = this.startRow;
    data['endRow'] = this.endRow;
    data['pages'] = this.pages;
    data['prePage'] = this.prePage;
    data['nextPage'] = this.nextPage;
    data['isFirstPage'] = this.isFirstPage;
    data['isLastPage'] = this.isLastPage;
    data['hasPreviousPage'] = this.hasPreviousPage;
    data['hasNextPage'] = this.hasNextPage;
    data['navigatePages'] = this.navigatePages;
    data['navigatepageNums'] = this.navigatepageNums;
    data['navigateFirstPage'] = this.navigateFirstPage;
    data['navigateLastPage'] = this.navigateLastPage;
    return data;
  }
}
class DevicesInfoDto {
  DevicesInfoDto({
    required this.id,
    required this.deviceId,
    required this.name,
    required this.manufacturer,
    required this.model,
    required this.firmware,
    required this.transport,
    required this.streamMode,
    required this.ip,
    required this.port,
    required this.hostAddress,
    required this.onLine,
    required this.registerTime,
    required this.keepaliveTime,
    required this.keepaliveIntervalTime,
    required this.channelCount,
    required this.expires,
    required this.createTime,
    required this.updateTime,
    required this.mediaServerId,
    required this.charset,
    required this.subscribeCycleForCatalog,
    required this.subscribeCycleForMobilePosition,
    required this.mobilePositionSubmissionInterval,
    required this.subscribeCycleForAlarm,
    required this.ssrcCheck,
    required this.geoCoordSys,
    required this.password,
    required this.sdpIp,
    required this.localIp,
    required this.asMessageChannel,
    required this.sipTransactionInfo,
    required this.broadcastPushAfterAck,
  });

  final int? id;
  final String? deviceId;
  final String? name;
  final String? manufacturer;
  final String? model;
  final String? firmware;
  final String? transport;
  final String? streamMode;
  final String? ip;
  final int? port;
  final String? hostAddress;
  final bool onLine;
  final DateTime? registerTime;
  final DateTime? keepaliveTime;
  final int? keepaliveIntervalTime;
  final int? channelCount;
  final int? expires;
  final DateTime? createTime;
  final DateTime? updateTime;
  final String? mediaServerId;
  final String? charset;
  final int? subscribeCycleForCatalog;
  final int? subscribeCycleForMobilePosition;
  final int? mobilePositionSubmissionInterval;
  final int? subscribeCycleForAlarm;
  final bool? ssrcCheck;
  final String? geoCoordSys;
  final dynamic password;
  final dynamic sdpIp;
  final String? localIp;
  final bool? asMessageChannel;
  final SipTransactionInfo? sipTransactionInfo;
  final bool? broadcastPushAfterAck;

  factory DevicesInfoDto.fromJson(Map<String, dynamic> json){
    return DevicesInfoDto(
      id: json["id"],
      deviceId: json["deviceId"],
      name: json["name"],
      manufacturer: json["manufacturer"],
      model: json["model"],
      firmware: json["firmware"],
      transport: json["transport"],
      streamMode: json["streamMode"],
      ip: json["ip"],
      port: json["port"],
      hostAddress: json["hostAddress"],
      onLine: json["onLine"],
      registerTime: DateTime.tryParse(json["registerTime"] ?? ""),
      keepaliveTime: DateTime.tryParse(json["keepaliveTime"] ?? ""),
      keepaliveIntervalTime: json["keepaliveIntervalTime"],
      channelCount: json["channelCount"],
      expires: json["expires"],
      createTime: DateTime.tryParse(json["createTime"] ?? ""),
      updateTime: DateTime.tryParse(json["updateTime"] ?? ""),
      mediaServerId: json["mediaServerId"],
      charset: json["charset"],
      subscribeCycleForCatalog: json["subscribeCycleForCatalog"],
      subscribeCycleForMobilePosition: json["subscribeCycleForMobilePosition"],
      mobilePositionSubmissionInterval: json["mobilePositionSubmissionInterval"],
      subscribeCycleForAlarm: json["subscribeCycleForAlarm"],
      ssrcCheck: json["ssrcCheck"],
      geoCoordSys: json["geoCoordSys"],
      password: json["password"],
      sdpIp: json["sdpIp"],
      localIp: json["localIp"],
      asMessageChannel: json["asMessageChannel"],
      sipTransactionInfo: json["sipTransactionInfo"] == null ? null : SipTransactionInfo.fromJson(json["sipTransactionInfo"]),
      broadcastPushAfterAck: json["broadcastPushAfterAck"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "deviceId": deviceId,
    "name": name,
    "manufacturer": manufacturer,
    "model": model,
    "firmware": firmware,
    "transport": transport,
    "streamMode": streamMode,
    "ip": ip,
    "port": port,
    "hostAddress": hostAddress,
    "onLine": onLine,
    "registerTime": registerTime?.toIso8601String(),
    "keepaliveTime": keepaliveTime?.toIso8601String(),
    "keepaliveIntervalTime": keepaliveIntervalTime,
    "channelCount": channelCount,
    "expires": expires,
    "createTime": createTime?.toIso8601String(),
    "updateTime": updateTime?.toIso8601String(),
    "mediaServerId": mediaServerId,
    "charset": charset,
    "subscribeCycleForCatalog": subscribeCycleForCatalog,
    "subscribeCycleForMobilePosition": subscribeCycleForMobilePosition,
    "mobilePositionSubmissionInterval": mobilePositionSubmissionInterval,
    "subscribeCycleForAlarm": subscribeCycleForAlarm,
    "ssrcCheck": ssrcCheck,
    "geoCoordSys": geoCoordSys,
    "password": password,
    "sdpIp": sdpIp,
    "localIp": localIp,
    "asMessageChannel": asMessageChannel,
    "sipTransactionInfo": sipTransactionInfo?.toJson(),
    "broadcastPushAfterAck": broadcastPushAfterAck,
  };

}

class SipTransactionInfo {
  SipTransactionInfo({
    required this.callId,
    required this.fromTag,
    required this.toTag,
    required this.viaBranch,
    required this.asSender,
  });

  final String? callId;
  final String? fromTag;
  final dynamic toTag;
  final String? viaBranch;
  final bool? asSender;

  factory SipTransactionInfo.fromJson(Map<String, dynamic> json){
    return SipTransactionInfo(
      callId: json["callId"],
      fromTag: json["fromTag"],
      toTag: json["toTag"],
      viaBranch: json["viaBranch"],
      asSender: json["asSender"],
    );
  }

  Map<String, dynamic> toJson() => {
    "callId": callId,
    "fromTag": fromTag,
    "toTag": toTag,
    "viaBranch": viaBranch,
    "asSender": asSender,
  };

}

/// 通道同步进度
class SyncProcess {
  int? total;
  int? current;
  String? errorMsg;
  bool? syncIng;

  SyncProcess({this.total, this.current, this.errorMsg, this.syncIng});

  SyncProcess.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    current = json['current'];
    errorMsg = json['errorMsg'];
    syncIng = json['syncIng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['current'] = this.current;
    data['errorMsg'] = this.errorMsg;
    data['syncIng'] = this.syncIng;
    return data;
  }
}

class ChannelSnapResp {
  ChannelSnapResp({
    required this.code,
    required this.msg,
    required this.data,
  });

  final int? code;
  final String? msg;
  final String? data;

  factory ChannelSnapResp.fromJson(Map<String, dynamic> json){
    return ChannelSnapResp(
      code: json["code"],
      msg: json["msg"],
      data: json["data"],
    );
  }

  Map<String, dynamic> toJson() => {
    "code": code,
    "msg": msg,
    "data": data,
  };

}


class ChannelQueryResp {
  ChannelQueryResp({
    required this.code,
    required this.msg,
    required this.data,
  });

  final int? code;
  final String? msg;
  final ChannelList? data;

  factory ChannelQueryResp.fromJson(Map<String, dynamic> json){
    return ChannelQueryResp(
      code: json["code"],
      msg: json["msg"],
      data: json["data"] == null ? null : ChannelList.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "code": code,
    "msg": msg,
    "data": data?.toJson(),
  };

}

class ChannelList {
  ChannelList({
    required this.total,
    required this.list,
    required this.pageNum,
    required this.pageSize,
    required this.size,
    required this.startRow,
    required this.endRow,
    required this.pages,
    required this.prePage,
    required this.nextPage,
    required this.isFirstPage,
    required this.isLastPage,
    required this.hasPreviousPage,
    required this.hasNextPage,
    required this.navigatePages,
    required this.navigatepageNums,
    required this.navigateFirstPage,
    required this.navigateLastPage,
  });

  final int? total;
  final List<ChannelElement> list;
  final int? pageNum;
  final int? pageSize;
  final int? size;
  final int? startRow;
  final int? endRow;
  final int? pages;
  final int? prePage;
  final int? nextPage;
  final bool? isFirstPage;
  final bool? isLastPage;
  final bool? hasPreviousPage;
  final bool? hasNextPage;
  final int? navigatePages;
  final List<int> navigatepageNums;
  final int? navigateFirstPage;
  final int? navigateLastPage;

  factory ChannelList.fromJson(Map<String, dynamic> json){
    return ChannelList(
      total: json["total"],
      list: json["list"] == null ? [] : List<ChannelElement>.from(json["list"]!.map((x) => ChannelElement.fromJson(x))),
      pageNum: json["pageNum"],
      pageSize: json["pageSize"],
      size: json["size"],
      startRow: json["startRow"],
      endRow: json["endRow"],
      pages: json["pages"],
      prePage: json["prePage"],
      nextPage: json["nextPage"],
      isFirstPage: json["isFirstPage"],
      isLastPage: json["isLastPage"],
      hasPreviousPage: json["hasPreviousPage"],
      hasNextPage: json["hasNextPage"],
      navigatePages: json["navigatePages"],
      navigatepageNums: json["navigatepageNums"] == null ? [] : List<int>.from(json["navigatepageNums"]!.map((x) => x)),
      navigateFirstPage: json["navigateFirstPage"],
      navigateLastPage: json["navigateLastPage"],
    );
  }

  Map<String, dynamic> toJson() => {
    "total": total,
    "list": list.map((x) => x?.toJson()).toList(),
    "pageNum": pageNum,
    "pageSize": pageSize,
    "size": size,
    "startRow": startRow,
    "endRow": endRow,
    "pages": pages,
    "prePage": prePage,
    "nextPage": nextPage,
    "isFirstPage": isFirstPage,
    "isLastPage": isLastPage,
    "hasPreviousPage": hasPreviousPage,
    "hasNextPage": hasNextPage,
    "navigatePages": navigatePages,
    "navigatepageNums": navigatepageNums.map((x) => x).toList(),
    "navigateFirstPage": navigateFirstPage,
    "navigateLastPage": navigateLastPage,
  };

}

class ChannelElement {
  ChannelElement({
    required this.gbId,
    required this.gbDeviceId,
    required this.gbName,
    required this.gbManufacturer,
    required this.gbModel,
    required this.gbOwner,
    required this.gbCivilCode,
    required this.gbBlock,
    required this.gbAddress,
    required this.gbParental,
    required this.gbParentId,
    required this.gbSafetyWay,
    required this.gbRegisterWay,
    required this.gbCertNum,
    required this.gbCertifiable,
    required this.gbErrCode,
    required this.gbEndTime,
    required this.gbSecrecy,
    required this.gbIpAddress,
    required this.gbPort,
    required this.gbPassword,
    required this.gbStatus,
    required this.gbLongitude,
    required this.gbLatitude,
    required this.gbBusinessGroupId,
    required this.gbPtzType,
    required this.gbPositionType,
    required this.gbRoomType,
    required this.gbUseType,
    required this.gbSupplyLightType,
    required this.gbDirectionType,
    required this.gbResolution,
    required this.gbDownloadSpeed,
    required this.gbSvcSpaceSupportMod,
    required this.gbSvcTimeSupportMode,
    required this.gbDeviceDbId,
    required this.streamPushId,
    required this.streamProxyId,
    required this.createTime,
    required this.updateTime,
    required this.id,
    required this.deviceDbId,
    required this.deviceId,
    required this.name,
    required this.manufacturer,
    required this.model,
    required this.owner,
    required this.civilCode,
    required this.block,
    required this.address,
    required this.parental,
    required this.parentId,
    required this.safetyWay,
    required this.registerWay,
    required this.certNum,
    required this.certifiable,
    required this.errCode,
    required this.endTime,
    required this.secrecy,
    required this.ipAddress,
    required this.port,
    required this.password,
    required this.status,
    required this.longitude,
    required this.latitude,
    required this.ptzType,
    required this.positionType,
    required this.roomType,
    required this.useType,
    required this.supplyLightType,
    required this.directionType,
    required this.resolution,
    required this.businessGroupId,
    required this.downloadSpeed,
    required this.svcSpaceSupportMod,
    required this.svcTimeSupportMode,
    required this.ptzTypeText,
    required this.subCount,
    required this.streamId,
    required this.hasAudio,
    required this.gpsTime,
    required this.streamIdentification,
    required this.channelType,
  });

  final int? gbId;
  final dynamic gbDeviceId;
  final dynamic gbName;
  final dynamic gbManufacturer;
  final dynamic gbModel;
  final dynamic gbOwner;
  final dynamic gbCivilCode;
  final dynamic gbBlock;
  final dynamic gbAddress;
  final dynamic gbParental;
  final dynamic gbParentId;
  final dynamic gbSafetyWay;
  final dynamic gbRegisterWay;
  final dynamic gbCertNum;
  final dynamic gbCertifiable;
  final dynamic gbErrCode;
  final dynamic gbEndTime;
  final dynamic gbSecrecy;
  final dynamic gbIpAddress;
  final dynamic gbPort;
  final dynamic gbPassword;
  final dynamic gbStatus;
  final dynamic gbLongitude;
  final dynamic gbLatitude;
  final dynamic gbBusinessGroupId;
  final dynamic gbPtzType;
  final dynamic gbPositionType;
  final dynamic gbRoomType;
  final dynamic gbUseType;
  final dynamic gbSupplyLightType;
  final dynamic gbDirectionType;
  final dynamic gbResolution;
  final dynamic gbDownloadSpeed;
  final dynamic gbSvcSpaceSupportMod;
  final dynamic gbSvcTimeSupportMode;
  final dynamic gbDeviceDbId;
  final dynamic streamPushId;
  final dynamic streamProxyId;
  final DateTime? createTime;
  final DateTime? updateTime;
  final int? id;
  final int? deviceDbId;
  final String? deviceId;
  final String? name;
  final String? manufacturer;
  final String? model;
  final String? owner;
  final String? civilCode;
  final dynamic block;
  final String? address;
  final int? parental;
  final dynamic parentId;
  final int? safetyWay;
  final int? registerWay;
  final dynamic certNum;
  final dynamic certifiable;
  final dynamic errCode;
  final dynamic endTime;
  final int? secrecy;
  final dynamic ipAddress;
  final dynamic port;
  final dynamic password;
  final String? status;
  final double? longitude;
  final double? latitude;
  final dynamic ptzType;
  final int? positionType;
  final int? roomType;
  final int? useType;
  final dynamic supplyLightType;
  final dynamic directionType;
  final dynamic resolution;
  final dynamic businessGroupId;
  final dynamic downloadSpeed;
  final dynamic svcSpaceSupportMod;
  final dynamic svcTimeSupportMode;
  final dynamic ptzTypeText;
  final int? subCount;
  final dynamic streamId;
  final bool? hasAudio;
  final dynamic gpsTime;
  final dynamic streamIdentification;
  final int? channelType;

  factory ChannelElement.fromJson(Map<String, dynamic> json){
    return ChannelElement(
      gbId: json["gbId"],
      gbDeviceId: json["gbDeviceId"],
      gbName: json["gbName"],
      gbManufacturer: json["gbManufacturer"],
      gbModel: json["gbModel"],
      gbOwner: json["gbOwner"],
      gbCivilCode: json["gbCivilCode"],
      gbBlock: json["gbBlock"],
      gbAddress: json["gbAddress"],
      gbParental: json["gbParental"],
      gbParentId: json["gbParentId"],
      gbSafetyWay: json["gbSafetyWay"],
      gbRegisterWay: json["gbRegisterWay"],
      gbCertNum: json["gbCertNum"],
      gbCertifiable: json["gbCertifiable"],
      gbErrCode: json["gbErrCode"],
      gbEndTime: json["gbEndTime"],
      gbSecrecy: json["gbSecrecy"],
      gbIpAddress: json["gbIpAddress"],
      gbPort: json["gbPort"],
      gbPassword: json["gbPassword"],
      gbStatus: json["gbStatus"],
      gbLongitude: json["gbLongitude"],
      gbLatitude: json["gbLatitude"],
      gbBusinessGroupId: json["gbBusinessGroupId"],
      gbPtzType: json["gbPtzType"],
      gbPositionType: json["gbPositionType"],
      gbRoomType: json["gbRoomType"],
      gbUseType: json["gbUseType"],
      gbSupplyLightType: json["gbSupplyLightType"],
      gbDirectionType: json["gbDirectionType"],
      gbResolution: json["gbResolution"],
      gbDownloadSpeed: json["gbDownloadSpeed"],
      gbSvcSpaceSupportMod: json["gbSvcSpaceSupportMod"],
      gbSvcTimeSupportMode: json["gbSvcTimeSupportMode"],
      gbDeviceDbId: json["gbDeviceDbId"],
      streamPushId: json["streamPushId"],
      streamProxyId: json["streamProxyId"],
      createTime: DateTime.tryParse(json["createTime"] ?? ""),
      updateTime: DateTime.tryParse(json["updateTime"] ?? ""),
      id: json["id"],
      deviceDbId: json["deviceDbId"],
      deviceId: json["deviceId"],
      name: json["name"],
      manufacturer: json["manufacturer"],
      model: json["model"],
      owner: json["owner"],
      civilCode: json["civilCode"],
      block: json["block"],
      address: json["address"],
      parental: json["parental"],
      parentId: json["parentId"],
      safetyWay: json["safetyWay"],
      registerWay: json["registerWay"],
      certNum: json["certNum"],
      certifiable: json["certifiable"],
      errCode: json["errCode"],
      endTime: json["endTime"],
      secrecy: json["secrecy"],
      ipAddress: json["ipAddress"],
      port: json["port"],
      password: json["password"],
      status: json["status"],
      longitude: json["longitude"],
      latitude: json["latitude"],
      ptzType: json["ptzType"],
      positionType: json["positionType"],
      roomType: json["roomType"],
      useType: json["useType"],
      supplyLightType: json["supplyLightType"],
      directionType: json["directionType"],
      resolution: json["resolution"],
      businessGroupId: json["businessGroupId"],
      downloadSpeed: json["downloadSpeed"],
      svcSpaceSupportMod: json["svcSpaceSupportMod"],
      svcTimeSupportMode: json["svcTimeSupportMode"],
      ptzTypeText: json["ptzTypeText"],
      subCount: json["subCount"],
      streamId: json["streamId"],
      hasAudio: json["hasAudio"],
      gpsTime: json["gpsTime"],
      streamIdentification: json["streamIdentification"],
      channelType: json["channelType"],
    );
  }

  Map<String, dynamic> toJson() => {
    "gbId": gbId,
    "gbDeviceId": gbDeviceId,
    "gbName": gbName,
    "gbManufacturer": gbManufacturer,
    "gbModel": gbModel,
    "gbOwner": gbOwner,
    "gbCivilCode": gbCivilCode,
    "gbBlock": gbBlock,
    "gbAddress": gbAddress,
    "gbParental": gbParental,
    "gbParentId": gbParentId,
    "gbSafetyWay": gbSafetyWay,
    "gbRegisterWay": gbRegisterWay,
    "gbCertNum": gbCertNum,
    "gbCertifiable": gbCertifiable,
    "gbErrCode": gbErrCode,
    "gbEndTime": gbEndTime,
    "gbSecrecy": gbSecrecy,
    "gbIpAddress": gbIpAddress,
    "gbPort": gbPort,
    "gbPassword": gbPassword,
    "gbStatus": gbStatus,
    "gbLongitude": gbLongitude,
    "gbLatitude": gbLatitude,
    "gbBusinessGroupId": gbBusinessGroupId,
    "gbPtzType": gbPtzType,
    "gbPositionType": gbPositionType,
    "gbRoomType": gbRoomType,
    "gbUseType": gbUseType,
    "gbSupplyLightType": gbSupplyLightType,
    "gbDirectionType": gbDirectionType,
    "gbResolution": gbResolution,
    "gbDownloadSpeed": gbDownloadSpeed,
    "gbSvcSpaceSupportMod": gbSvcSpaceSupportMod,
    "gbSvcTimeSupportMode": gbSvcTimeSupportMode,
    "gbDeviceDbId": gbDeviceDbId,
    "streamPushId": streamPushId,
    "streamProxyId": streamProxyId,
    "createTime": createTime?.toIso8601String(),
    "updateTime": updateTime?.toIso8601String(),
    "id": id,
    "deviceDbId": deviceDbId,
    "deviceId": deviceId,
    "name": name,
    "manufacturer": manufacturer,
    "model": model,
    "owner": owner,
    "civilCode": civilCode,
    "block": block,
    "address": address,
    "parental": parental,
    "parentId": parentId,
    "safetyWay": safetyWay,
    "registerWay": registerWay,
    "certNum": certNum,
    "certifiable": certifiable,
    "errCode": errCode,
    "endTime": endTime,
    "secrecy": secrecy,
    "ipAddress": ipAddress,
    "port": port,
    "password": password,
    "status": status,
    "longitude": longitude,
    "latitude": latitude,
    "ptzType": ptzType,
    "positionType": positionType,
    "roomType": roomType,
    "useType": useType,
    "supplyLightType": supplyLightType,
    "directionType": directionType,
    "resolution": resolution,
    "businessGroupId": businessGroupId,
    "downloadSpeed": downloadSpeed,
    "svcSpaceSupportMod": svcSpaceSupportMod,
    "svcTimeSupportMode": svcTimeSupportMode,
    "ptzTypeText": ptzTypeText,
    "subCount": subCount,
    "streamId": streamId,
    "hasAudio": hasAudio,
    "gpsTime": gpsTime,
    "streamIdentification": streamIdentification,
    "channelType": channelType,
  };

}
