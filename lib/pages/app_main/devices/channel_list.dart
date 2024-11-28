import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../config/app_config.dart';
import '../../../models/devices.m.dart';
import '../../../routes/route_name.dart';
import '../../../services/api_devices_service.dart' as DevicesApi;
import '../../../utils/tool/log_util.dart';
import 'components/error.dart';

class ChannelListPage extends StatefulWidget{
  const ChannelListPage({super.key, this.params });
  final dynamic params;

  @override
  State<ChannelListPage> createState() => _ChannelListPageState();
}

class _ChannelListPageState extends State<ChannelListPage> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => false;

  FocusNode focusNode = FocusNode();

  final PagingController<int, ChannelElement> _pagingController =
  PagingController(firstPageKey: 1);

  late String deviceId;
  late bool onLine;

  @override
  void initState() {
    super.initState();
    LogUtil.d(widget.params);
    deviceId = widget.params['deviceId'];
    onLine = widget.params['onLine'];

    _pagingController.addPageRequestListener(_fetchPage);
    _pagingController.addStatusListener(_showError);

    updateChannelsList();
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
    focusNode.dispose();
  }

  void updateChannelsList() async {
    _pagingController.refresh();
  }

  void _fetchPage(int pageKey) async {
    try {
      ChannelQueryResp resp = await DevicesApi.getChannelQuery(deviceId, pageKey, 10);
      final newItems = resp.data?.list as List<ChannelElement>;

      final isLastPage = newItems.isEmpty;
      if(isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }
  void _showError(PagingStatus status) async {
    if (status == PagingStatus.subsequentPageError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Something went wrong while fetching a new page.',
          ),
          action: SnackBarAction(
            label: 'Retry',
            onPressed: () => _pagingController.retryLastFailedRequest(),
          ),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: BrnAppBar(
        title: '通道列表',
      ),
      body: _buildChannelList()
    );
  }

  Widget _buildChannelList() {
    return RefreshIndicator(
      onRefresh: () async => _pagingController.refresh(),
      child: PagedListView<int, ChannelElement>.separated(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate(
        animateTransitions: true,
          itemBuilder: (context, item, index) => BrnShadowCard(
            circular: 5,
            padding: const EdgeInsets.only(
              top: 5,
              left: 5,
              right: 5,
              bottom: 5,
            ),
            child: GestureDetector(
              child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Image.network(
                        "${AppConfig.host}/api/device/query/snap/$deviceId/${item.deviceId}",
                        width: 72,
                        height: 72,
                        fit: BoxFit.fill,
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BrnStateTag(
                              tagText: onLine ? '在线' : '离线',
                              tagState: onLine ? TagState.succeed: TagState.failed,
                            ),
                            Text('名称: ${item.name}'),
                            Text('编号:${item.deviceId}'),
                          ],
                         ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ElevatedButton.icon(
                            icon: Icon(Icons.play_arrow),
                            label: Text("播放"),
                            onPressed: () {},
                          ),
                          ElevatedButton.icon(
                            icon: Icon(Icons.emergency_recording),
                            label: Text("录像"),
                            onPressed: () {},
                          )
                        ],
                      )
                    ],
                  )
              ),
            )
          ),
          firstPageErrorIndicatorBuilder: (context) =>
              CustomFirstPageError(pagingController: _pagingController),
          newPageErrorIndicatorBuilder: (context) =>
              CustomNewPageError(pagingController: _pagingController),
        ), separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}