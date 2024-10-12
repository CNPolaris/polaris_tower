import 'package:flutter/material.dart';

import '../../../../models/common.m.dart';



class CpuInfoStore extends ChangeNotifier {

  List<CpuInfo?>? cpuList = [];

  void set(List<CpuInfo?>? list) {
    cpuList = list;
    notifyListeners();
  }
}