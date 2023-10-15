import 'package:flutter/material.dart';

abstract class BasicGroupConfig {
  /// 每一个组的标题
  String? title;

  List<BasicItemConfig>? configList;

  BasicGroupConfig({this.title, required this.configList});
}

/// 每一个 item 的配置接口，定制化的需求可以自己实现相关接口
abstract class BasicItemConfig {
  /// 该配置的 groupIndex
  int? groupIndex;

  /// 该配置的 type 信息
  String? type;

  /// 构建查看详情页的 widget
  Widget buildDetailWidget(BuildContext context,
      List<BasicGroupConfig> allConfig, int groupId, int index);

  /// 构建简略页的 widget
  Widget buildSummaryWidget(BuildContext context,
      List<BasicGroupConfig> allConfig, int groupId, int index);
}
