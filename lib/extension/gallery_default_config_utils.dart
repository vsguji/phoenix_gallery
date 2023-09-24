import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';
import '../config/gallery_detail_config.dart';
import 'package:phoenix_navbar/phoenix_navbar.dart' as phoenix;

/// 查看图片配置
extension BaseGalleryConfigUtils on BaseDefaultConfigUtils {
  ///
  static GalleryDetailConfig defaultGalleryDetailConfig = GalleryDetailConfig(
    appbarTitleStyle: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.colorTextBaseInverse,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeSubHead,
      fontWeight: FontWeight.w600,
    ),
    appbarActionStyle: BaseTextStyle(
      color: phoenix.AppBarTheme.lightTextColor,
      fontSize: phoenix.AppBarTheme.actionFontSize,
      fontWeight: FontWeight.w600,
    ),
    appbarBackgroundColor: Colors.black,
    appbarConfig: phoenix.AppBarConfig.dark(),
    tabBarUnSelectedLabelStyle: BaseTextStyle(
      fontSize: 16.0,
      color: const Color(0XFFCCCCCC),
    ),
    tabBarLabelStyle: BaseTextStyle(
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeSubHead,
      fontWeight: FontWeight.w600,
      color: BaseDefaultConfigUtils.defaultCommonConfig.colorTextBaseInverse,
    ),
    tabBarBackgroundColor: Colors.black,
    pageBackgroundColor: Colors.black,
    bottomBackgroundColor: const Color(0X88000000),
    titleStyle: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.colorTextBaseInverse,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeHead,
      fontWeight: FontWeight.w600,
    ),
    contentStyle: BaseTextStyle(
      color: const Color(0xFFCCCCCC),
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeBase,
    ),
    actionStyle: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.colorTextBaseInverse,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeBase,
    ),
    iconColor: Colors.white,
  );
}
