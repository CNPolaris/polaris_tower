import 'dart:async';

import 'package:flutter/material.dart';
import 'package:polaris_tower/utils/index.dart';
import 'package:provider/provider.dart';
import '../../../config/app_config.dart';
import '../../../models/common.m.dart';
import 'components/resource_chart.dart';
import './provider/cpuInfoStore.p.dart';
import './components/cpu_chart.dart';
import './components/memory_chart.dart';
import '../../../services/common_service.dart';

class Home extends StatefulWidget {
  const Home({super.key, this.params});
  final dynamic params;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {

  late CpuInfoStore _cpuInfoStore;

  @override
  bool get wantKeepAlive => true;

  FocusNode blankNode = FocusNode(); // 响应空白处的焦点的Node

  late Timer _updateSystemInfoTimer;

  Device _device = Device();
  Device _push = Device();
  Device _proxy = Device();
  Device _channel = Device();


  @override
  void initState() {
    super.initState();

    _updateSystemInfoTimer = Timer.periodic(Duration(milliseconds: AppConfig.updateDelay), (timer) async {
      ///定时任务
      SystemInfoResp sysInfoRes = await getSystemInfo();
      if(sysInfoRes.code == 0) {
        List<CpuInfo?>? cpuList = sysInfoRes.data!.cpu;
        _cpuInfoStore.set(cpuList);
      }

      ResourceInfoResp resp = await getResourceInfo();
      if (resp.code == 0) {
        _device = resp.data!.device!;
        _channel = resp.data!.channel!;
        _proxy = resp.data!.proxy!;
        _push = resp.data!.push!;
      }
    });
  }

  @override
  void activate() {
    super.activate();
  }

  @override
  void dispose() {
    super.dispose();
    _updateSystemInfoTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    _cpuInfoStore = Provider.of<CpuInfoStore>(context);

    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('控制台'),
        automaticallyImplyLeading: false,
      ),
      body: GestureDetector(
        onTap: () {
          // 点击空白页面关闭键盘
          FocusScope.of(context).requestFocus(blankNode);
        },
        child: contextWidget(width),
      ),
    );
  }

  Widget contextWidget(double width) {
    return ListView(
      children: List.generate(1, (index) {
        return Column(
            children: <Widget>[
              _buildDeviceChannelInfo(width),
              _buildDeviceChannelInfo2(width),
              _buildCpuChartWidget(),
              _buildMemoryChartWidget(),
            ]
        );
      }),
    );
  }

  Widget _buildDeviceChannelInfo(double width) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
        bottom: 5,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: IntrinsicHeight(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ResourceIndicatorWidget(
                    // No gradient
                    colors: const [Colors.blue, Colors.blue],
                    radius: (width - 40) / 6,
                    stokeWidth: 8.0,
                    value: _device.online,
                    total: _device.total,
                    title: "在线设备",
                  ),
                  ResourceIndicatorWidget(
                    // No gradient
                    colors: const [Colors.blue, Colors.blue],
                    radius: (width - 40) / 6,
                    stokeWidth: 8.0,
                    value: _channel.online,
                    total: _channel.total,
                    title: "通道总数",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeviceChannelInfo2(double width) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
        bottom: 5,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: IntrinsicHeight(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ResourceIndicatorWidget(
                    // No gradient
                    colors: const [Colors.blue, Colors.blue],
                    radius: (width - 40) / 6,
                    stokeWidth: 8.0,
                    value: _push.online,
                    total: _push.total,
                    title: "推流总数",
                  ),
                  ResourceIndicatorWidget(
                    // No gradient
                    colors: const [Colors.blue, Colors.blue],
                    radius: (width - 40) / 6,
                    stokeWidth: 8.0,
                    value: _proxy.online,
                    total: _proxy.total,
                    title: "代理总数",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCpuChartWidget() {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(
        top: 5,
        left: 10,
        right: 10,
        bottom: 5
      ),
      child: Column(
        children: [
          const Text("CPU", style: style, textAlign: TextAlign.center),
          CpuChartWidget(),
        ],
      ),
    );
  }

  Widget _buildMemoryChartWidget() {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(
          top: 5,
          left: 10,
          right: 10,
          bottom: 5
      ),
      child: const Column(
        children: [
          Text("内存", style: style, textAlign: TextAlign.center),
          MemoryChartWidget()
        ],
      ),
    );
  }
}
