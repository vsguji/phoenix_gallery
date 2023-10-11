/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2023-08-31 14:41:55
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-10-11 22:20:17
 * @FilePath: /phoenix_gallery/lib/config/controller.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';

/// 控制页面刷新，并跳转到指定的 index
class GalleryController extends ChangeNotifier {
  int groupId = 0;
  int indexId = 0;

  /// 页面刷新，跳转到指定的 index
  /// [groupId] 第几组图片
  /// [indexId] 组内的第几张
  void refresh(int groupId, int indexId) {
    this.groupId = groupId;
    this.indexId = indexId;
    notifyListeners();
  }
}
