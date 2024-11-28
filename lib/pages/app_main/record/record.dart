import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import '../../../utils/index.dart';

class RecordPage extends StatefulWidget{
  const RecordPage({super.key, this.params});
  final dynamic params;

  @override
  State<RecordPage> createState() => _RecordPageState();

}

class _RecordPageState extends State<RecordPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;

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
      appBar: BrnAppBar(
        title: const Text ('云端录像'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(),
    );
  }

}