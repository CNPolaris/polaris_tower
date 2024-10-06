import 'package:flutter/material.dart';
import '../../../utils/index.dart';

class DevicesPage extends StatefulWidget{
  const DevicesPage({super.key, this.params});
  final dynamic params;

  @override
  State<DevicesPage> createState() => _DevicesPageState();

}

class _DevicesPageState extends State<DevicesPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    LogUtil.d(widget.params);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text ('国标设备'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(),
    );
  }
}