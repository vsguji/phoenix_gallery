/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2023-09-13 20:09:03
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-10-15 14:57:09
 * @FilePath: /phoenix_gallery/lib/page/gallery_detail_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';
import 'package:phoenix_gallery/extension/gallery_total_config.dart';
import 'package:phoenix_navbar/phoenix_navbar.dart';
import 'package:phoenix_tabbar/phoenix_tabbar.dart';

import '../config/basic_gallery_config.dart';
import '../config/controller.dart';
import '../config/gallery_detail_config.dart';
import 'package:phoenix_navbar/phoenix_navbar.dart' as phoenix;

import 'gallery_summary_page.dart';

/// 查看大图交互模式-详情页
/// 组件提供了（列表页<-->详情页）这种交互模式的骨架，
/// 适用于查看图片，视频 PDF 等场景。
/// 默认只实现了图片的查看，如果想要扩展视频或者pdf自行扩展配置接口可实现。
// ignore: must_be_immutable
class GalleryDetailPage extends StatefulWidget {
  /// 该交互下所有 item 的配置集合
  final List<BasicGroupConfig> allConfig;

  /// 初始位于第几组，默认 0
  final int initGroupId;

  /// 初始位于组内的第几个，默认 0
  final int initIndexId;

  /// 是否来自于列表页，一般情况不要使用，默认 false
  final bool fromSummary;

  /// 右上角自定义设置按钮，若为空，则展示 "全部图片"
  final Widget Function(int? groupId, int? indexId)? detailRightAction;

  /// 控制图片查看刷新
  final GalleryController? controller;

  /// 主题配置
  GalleryDetailConfig? themeData;

  GalleryDetailPage(
      {Key? key,
      required this.allConfig,
      this.initGroupId = 0,
      this.initIndexId = 0,
      this.fromSummary = false,
      this.detailRightAction,
      this.controller,
      this.themeData})
      : super(key: key) {
    themeData ??= GalleryDetailConfig();
    themeData = BaseThemeConfig.instance
        .getConfig(configId: themeData!.configId)
        .galleryDetailConfig
        .merge(themeData);
  }

  @override
  _BrnGalleryDetailPageState createState() => _BrnGalleryDetailPageState();
}

class _BrnGalleryDetailPageState extends State<GalleryDetailPage>
    with TickerProviderStateMixin {
  /// title 关联的通知，因为 title 与图片所处的位置关联
  ValueNotifier<String>? _titleNotifier;
  TabController? _tabController;
  final List<BasicGroupConfig> _allConfig = <BasicGroupConfig>[];
  int? _curTab;
  int? _curIndex;
  bool _assorted = false;
  final List<Widget> _columnViews = <Widget>[];
  final List<BadgeTab> _tabs = <BadgeTab>[];
  String _groupTitle = "";
  String _indexTitle = "";
  PageController? _pageController;
  final List<Widget> _pageViews = <Widget>[];
  final Map _groupStartPosition = Map();
  final Map _groupCount = Map();
  int _allCount = 0;
  phoenix.AppBarConfig? _appBarConfig;

  late BaseTabBarConfig _tabBarConfig;

  @override
  void initState() {
    super.initState();

    // 打平 appbar
    _appBarConfig = BaseThemeConfig.instance
        .getConfig(configId: widget.themeData!.configId)
        .appBarConfig
        .merge(widget.themeData!.appbarConfig)
        .merge(phoenix.AppBarConfig(
          titleStyle: widget.themeData!.appbarTitleStyle,
          backgroundColor: widget.themeData!.appbarBackgroundColor,
          actionsStyle: widget.themeData!.appbarActionStyle,
        ));

    // 打平 tabBar
    _tabBarConfig = BaseThemeConfig.instance
        .getConfig(configId: widget.themeData!.configId)
        .tabBarConfig
        .merge(BaseTabBarConfig(
          unselectedLabelStyle: widget.themeData!.tabBarUnSelectedLabelStyle,
          labelStyle: widget.themeData!.tabBarLabelStyle,
          backgroundColor: widget.themeData!.tabBarBackgroundColor,
        ));

    _curIndex = widget.initIndexId;
    _curTab = widget.initGroupId;
    if (widget.controller != null) {
      widget.controller!.addListener(_refreshByController);
    }
  }

  @override
  void didUpdateWidget(GalleryDetailPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != null &&
        oldWidget.controller != widget.controller) {
      oldWidget.controller?.removeListener(_refreshByController);
      widget.controller!.addListener(_refreshByController);
    }
  }

  void _refreshByController() {
    if (mounted) {
      _curIndex = widget.controller!.indexId;
      _curTab = widget.controller!.groupId;
      setState(() {});
    }
  }

  /// 根据groupIndex和index查page的位置
  int? _getPagePosition(int? groupIndex, int? index) {
    return _groupStartPosition[groupIndex] + index;
  }

  /// 根据page的位置反查groupIndex和index
  List<int> _getGroupIndexAndIndex(int pagePosition) {
    List<int> result = <int>[];
    MapEntry entry = _groupStartPosition.entries.toList().firstWhere((entry) {
      return (entry.value > pagePosition);
    });
    result.add(entry.key - 1);
    result.add(pagePosition - (_groupStartPosition[entry.key - 1]) as int);
    return result;
  }

  void _reset() {
    _pageViews.clear();
    _tabs.clear();
    _columnViews.clear();
    _allConfig.clear();
    // 过滤 config 中内容为空的选项
    widget.allConfig.forEach((e) {
      if (e.configList != null && e.configList!.isNotEmpty) {
        _allConfig.add(e);
      }
    });

    _allCount = 0;
    _groupCount.clear();
    _groupStartPosition.clear();
    _titleNotifier = null;
    _tabController = null;
  }

  void _buildViews() {
    _reset();
    _titleNotifier = ValueNotifier<String>('');
    _tabController = TabController(
        length: _allConfig.length, vsync: this, initialIndex: _curTab!)
      ..addListener(() {
        _curTab = _tabController!.index;
      });

    int i = 0;
    for (; i < _allConfig.length; i++) {
      _groupStartPosition[i] = _allCount;
      _allCount += _allConfig[i].configList!.length;
      _groupCount[i] = _allConfig[i].configList!.length;
    }
    _groupStartPosition[i] = _allCount;

    _pageController =
        PageController(initialPage: _getPagePosition(_curTab, _curIndex)!);
    _assorted = _allConfig.length > 1;

    _allConfig.forEach((item) => _tabs.add(
        BadgeTab(text: '${item.title ?? ""}(${item.configList!.length})')));
    if (_allConfig.length > 1) {
      _columnViews.add(PhoenixTabBar(
        backgroundcolor: _tabBarConfig.backgroundColor,
        unselectedLabelStyle:
            _tabBarConfig.unselectedLabelStyle.generateTextStyle(),
        unselectedLabelColor: _tabBarConfig.unselectedLabelStyle.color,
        labelColor: _tabBarConfig.labelStyle.color,
        indicatorColor: _tabBarConfig.labelStyle.color,
        labelStyle: _tabBarConfig.labelStyle.generateTextStyle(),
        tabs: _tabs,
        controller: _tabController,
        onTap: (state, index) {
          _pageController!.animateToPage(_getPagePosition(index, 0)!,
              duration: Duration(microseconds: 100), curve: Curves.linear);
        },
      ));
    }

    for (int i = 0; i < _allConfig.length; i++) {
      for (int j = 0; j < _allConfig[i].configList!.length; j++) {
        _pageViews.add(_allConfig[i]
            .configList![j]
            .buildDetailWidget(context, _allConfig, i, j));
      }
    }
    _groupTitle = _allConfig[_curTab!].title ?? "";
    _indexTitle =
        "${_curIndex! + 1}/${_allConfig[_curTab!].configList!.length}";
    _titleNotifier?.value =
        _assorted ? "$_groupTitle($_indexTitle)" : "$_indexTitle";

    _columnViews.add(Expanded(
      child: PageView(
        controller: _pageController,
        onPageChanged: (index) async {
          //当滑动时动态改变title信息以及确认tab是否需要切换
          await _moveToIndex(index);
        },
        children: _pageViews,
      ),
    ));
  }

  Future<void>? _moveToIndex(index) {
    // 改变 title
    List<int> pos = _getGroupIndexAndIndex(index);
    _indexTitle = "${pos[1] + 1}/${_groupCount[pos[0]]}";
    _groupTitle = _allConfig[pos[0]].title ?? "";
    _curIndex = pos[1];
    // 处理是是否需要切换 tab
    if (_curTab != pos[0]) {
      _curTab = pos[0];
      _tabController!.animateTo(pos[0]);
    }
    _titleNotifier?.value =
        _assorted ? "$_groupTitle($_indexTitle)" : "$_indexTitle";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    _buildViews();
    return Scaffold(
      key: GlobalKey(),
      appBar: PhoenixAppBar(
        backgroundColor: _appBarConfig!.backgroundColor,
        showDefaultBottom: false,
        themeData: _appBarConfig,
        title: ValueListenableBuilder(
          valueListenable: _titleNotifier!,
          builder: (c, String v, _) {
            return Text(
              v,
              style: _appBarConfig!.titleStyle.generateTextStyle(),
            );
          },
        ),
        actions: widget.detailRightAction != null
            ? ValueListenableBuilder(
                builder: (c, v, _) =>
                    widget.detailRightAction!(_curTab, _curIndex),
                valueListenable: _titleNotifier!,
              )
            : BrnTextAction(
                BrnIntl.of(context).localizedResource.allPics,
                themeData: _appBarConfig,
                iconPressed: () {
                  if (widget.fromSummary) {
                    Navigator.of(context).pop();
                  } else {
                    Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (context) {
                      return GallerySummaryPage(
                        controller: widget.controller,
                        allConfig: _allConfig,
                        fromDetail: true,
                      );
                    })).then((result) {
                      if (result is List) {
                        _tabController!.animateTo(result[0]);
                        _pageController!.jumpToPage(
                            _getPagePosition(result[0], result[1])!);
                      }
                    });
                  }
                },
              ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    if (_allConfig.isEmpty) return Row();
    return NotificationListener(
      child: Container(
        color: widget.themeData!.pageBackgroundColor,
        child: Column(
          children: _columnViews,
        ),
      ),
    );
  }
}
