import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:polaris_tower/routes/route_name.dart';
import '../../../models/devices.m.dart';
import '../../../utils/index.dart';
import '../../../services/api_devices_service.dart' as DevicesApi;
import 'components/error.dart';

class DevicesPage extends StatefulWidget{
  const DevicesPage({super.key, this.params});
  final dynamic params;

  @override
  State<DevicesPage> createState() => _DevicesPageState();

}

class _DevicesPageState extends State<DevicesPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;

  FocusNode focusNode = FocusNode(); // 响应空白处的焦点的Node
  // 搜索控件监听
  BrnSearchTextController searchController = BrnSearchTextController();
  TextEditingController textController = TextEditingController();

  final PagingController<int, DevicesInfoDto> _pagingController =
  PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    LogUtil.d(widget.params);

    _pagingController.addPageRequestListener(_fetchPage);
    _pagingController.addStatusListener(_showError);

    textController.addListener((){
      if(focusNode.hasFocus){
        if(textController.text.isNotEmpty) {
          searchController.isClearShow = true;
          searchController.isActionShow = true;
        }
      }
    });
    focusNode.addListener((){
      if(focusNode.hasFocus){
        if(textController.text.isNotEmpty) {
          searchController.isClearShow = true;
        }
      }
    });

    updateDevicesList();
  }

  void _fetchPage(int pageKey) async {
    try {
      DevicesQueryResp resp = await DevicesApi.getDeviceQueryList(pageKey, 10);
      final newItems = resp.data?.list as List<DevicesInfoDto>;

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

  void updateDevicesList() async {
    _pagingController.refresh();
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
    textController.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: BrnAppBar(
        title: const Text ('国标设备'),
        automaticallyImplyLeading: false,
      ),

      body: Container(
        child: _buildPageListView(),
      ),
    );
  }

  Widget _buildSearchWidget() {
    return BrnSearchText(
      focusNode: focusNode,
      controller: textController,
      hintText: '搜索设备',
      onTextClear: () {
        return false;
      },
      autoFocus: true,
      onActionTap: () {
        focusNode.unfocus();
      },
      onTextCommit: (text) {
        BrnToast.show('提交内容 : $text', context);
      },
    );
  }

  Widget _buildPageListView() {
    return RefreshIndicator(
      onRefresh: () async => _pagingController.refresh(),
      child: PagedListView<int, DevicesInfoDto>.separated(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate(
          animateTransitions: true,
          itemBuilder: (context, item, index) => BrnShadowCard(
            borderWidth: 0,
            circular: 5,
            blurRadius: 0,
            padding: const EdgeInsets.only(
              top: 5,
              left: 5,
              right: 5,
              bottom: 5,
            ),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.channel, arguments: {'deviceId': item.deviceId, 'onLine': item.onLine});
                },
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('设备编号: ${item.deviceId.toString()}'),
                          const Spacer(),
                          Text('信令模式: ${item.transport}')
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('地址: ${item.ip}'),
                          const Spacer(),
                          Text('通道数: ${item.channelCount}')
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('最近心跳: ${item.keepaliveTime}'),
                          const Spacer(),
                          BrnStateTag(
                            tagText: item.onLine ? '在线' : '离线',
                            tagState: item.onLine ? TagState.succeed: TagState.failed,
                          )
                        ],
                      )
                    ],
                  ),
                ),
          ),
            ),
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