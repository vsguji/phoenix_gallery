import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';
import 'package:phoenix_gallery/extension/gallery_total_config.dart';
import 'package:phoenix_navbar/phoenix_navbar.dart' as phoenix;

import '../extension/gallery_default_config_utils.dart';

/// 查看大图配置
class GalleryDetailConfig extends BaseConfig {
  /// 遵循全局配置
  /// 默认为 [BaseGalleryConfigUtils.defaultGalleryDetailConfig]
  GalleryDetailConfig({
    BaseTextStyle? appbarTitleStyle,
    BaseTextStyle? appbarActionStyle,
    Color? appbarBackgroundColor,
    phoenix.AppBarConfig? appbarConfig,
    BaseTextStyle? tabBarUnSelectedLabelStyle,
    BaseTextStyle? tabBarLabelStyle,
    Color? tabBarBackgroundColor,
    Color? pageBackgroundColor,
    Color? bottomBackgroundColor,
    BaseTextStyle? titleStyle,
    BaseTextStyle? contentStyle,
    BaseTextStyle? actionStyle,
    Color? iconColor,
    String configId = GLOBAL_CONFIG_ID,
  })  : _appbarTitleStyle = appbarTitleStyle,
        _appbarActionStyle = appbarActionStyle,
        _appbarBackgroundColor = appbarBackgroundColor,
        _appbarConfig = appbarConfig,
        _tabBarUnSelectedLabelStyle = tabBarUnSelectedLabelStyle,
        _tabBarLabelStyle = tabBarLabelStyle,
        _tabBarBackgroundColor = tabBarBackgroundColor,
        _pageBackgroundColor = pageBackgroundColor,
        _bottomBackgroundColor = bottomBackgroundColor,
        _titleStyle = titleStyle,
        _contentStyle = contentStyle,
        _actionStyle = actionStyle,
        _iconColor = iconColor,
        super(configId: configId);

  /// 黑色主题
  GalleryDetailConfig.dark({
    String configId = GLOBAL_CONFIG_ID,
  }) : super(configId: configId) {
    _appbarTitleStyle = BaseTextStyle(color: commonConfig.colorTextBaseInverse);
    _appbarActionStyle =
        BaseTextStyle(color: phoenix.AppBarTheme.lightTextColor);
    _appbarBackgroundColor = Colors.black;
    _appbarConfig = phoenix.AppBarConfig.dark();
    _tabBarUnSelectedLabelStyle = BaseTextStyle(color: Color(0XFFCCCCCC));
    _tabBarLabelStyle = BaseTextStyle(color: commonConfig.colorTextBaseInverse);
    _tabBarBackgroundColor = Colors.black;
    _pageBackgroundColor = Colors.black;
    _bottomBackgroundColor = Color(0X88000000);
    _titleStyle = BaseTextStyle(color: commonConfig.colorTextBaseInverse);
    _contentStyle = BaseTextStyle(color: Color(0xFFCCCCCC));
    _actionStyle = BaseTextStyle(color: commonConfig.colorTextBaseInverse);
    _iconColor = Colors.white;
  }

  /// 白色主题
  GalleryDetailConfig.light({
    String configId = GLOBAL_CONFIG_ID,
  }) : super(configId: configId) {
    _appbarTitleStyle = BaseTextStyle(color: commonConfig.colorTextBase);
    _appbarActionStyle = BaseTextStyle(color: commonConfig.colorTextBase);
    _appbarBackgroundColor = commonConfig.fillBody;
    _appbarConfig = phoenix.AppBarConfig.light();
    _tabBarUnSelectedLabelStyle = BaseTextStyle(
      color: commonConfig.colorTextBase,
    );
    _tabBarLabelStyle = BaseTextStyle(color: commonConfig.brandPrimary);
    _tabBarBackgroundColor = commonConfig.fillBody;
    _pageBackgroundColor = commonConfig.fillBody;
    _bottomBackgroundColor = commonConfig.fillBody.withOpacity(.85);
    _titleStyle = BaseTextStyle(color: commonConfig.colorTextBase);
    _contentStyle = BaseTextStyle(color: commonConfig.colorTextBase);
    _actionStyle = BaseTextStyle(color: commonConfig.colorTextSecondary);
    _iconColor = commonConfig.colorTextSecondary;
  }

  /// appbar   brightness待定

  /// appbar 标题样式
  ///
  /// BaseTextStyle(
  ///   color: [BrnCommonConfig.colorTextBaseInverse],
  ///   fontSize: [BrnCommonConfig.fontSizeHead],
  ///   fontWeight: FontWeight.w600,
  /// )
  BaseTextStyle? _appbarTitleStyle;

  /// 右侧操作区域文案样式
  ///
  /// BaseTextStyle(
  ///   color: AppBarBrightness(brightness).textColor,
  ///   fontSize: BrnAppBarTheme.actionFontSize,
  ///   fontWeight: FontWeight.w600,
  /// )
  BaseTextStyle? _appbarActionStyle;

  /// appBar 背景色
  /// 默认为 Colors.black
  Color? _appbarBackgroundColor;

  /// appbar brightness
  /// 默认为 [Brightness.dark]
  phoenix.AppBarConfig? _appbarConfig;

  /// tabBar 标题普通样式
  ///
  /// BaseTextStyle(
  ///   color: Colors.red,
  ///   fontSize: [BrnCommonConfig.fontSizeSubHead],
  /// )
  BaseTextStyle? _tabBarUnSelectedLabelStyle;

  /// tabBar 标题选中样式
  ///
  /// BaseTextStyle(
  ///   color: [BrnCommonConfig.colorTextBaseInverse],
  ///   fontSize: [BrnCommonConfig.fontSizeSubHead],
  ///   fontWeight: FontWeight.w600,
  /// )
  BaseTextStyle? _tabBarLabelStyle;

  /// tabBar 背景色
  /// 默认为 Colors.black
  Color? _tabBarBackgroundColor;

  /// 页面 背景色
  /// 默认为 Colors.black
  Color? _pageBackgroundColor;

  /// 底部内容区域的背景色
  /// 默认为 Color(0x88000000)
  Color? _bottomBackgroundColor;

  /// 标题文案样式
  ///
  /// BaseTextStyle(
  ///   color: [BrnCommonConfig.colorTextBaseInverse],
  ///   fontSize: [BrnCommonConfig.fontSizeHead],
  ///   fontWeight: FontWeight.w600,
  /// )
  BaseTextStyle? _titleStyle;

  /// 内容文案样式
  ///
  /// BaseTextStyle(
  ///   color: Color(0xFFCCCCCC),
  ///   fontSize: [BrnCommonConfig.fontSizeBase],
  /// )
  BaseTextStyle? _contentStyle;

  /// 右侧展开收起样式
  ///
  /// BaseTextStyle(
  ///   color: [BrnCommonConfig.colorTextBaseInverse],
  ///   fontSize: [BrnCommonConfig.fontSizeBase],
  /// )
  BaseTextStyle? _actionStyle;

  /// icon 颜色
  /// 默认为 Colors.white
  Color? _iconColor;

  BaseTextStyle get appbarTitleStyle =>
      _appbarTitleStyle ??
      BaseGalleryConfigUtils.defaultGalleryDetailConfig.appbarTitleStyle;

  BaseTextStyle get appbarActionStyle =>
      _appbarActionStyle ??
      BaseGalleryConfigUtils.defaultGalleryDetailConfig.appbarActionStyle;

  Color get appbarBackgroundColor =>
      _appbarBackgroundColor ??
      BaseGalleryConfigUtils.defaultGalleryDetailConfig.appbarBackgroundColor;

  phoenix.AppBarConfig get appbarConfig =>
      _appbarConfig ??
      BaseGalleryConfigUtils.defaultGalleryDetailConfig.appbarConfig;

  BaseTextStyle get tabBarUnSelectedLabelStyle =>
      _tabBarUnSelectedLabelStyle ??
      BaseGalleryConfigUtils
          .defaultGalleryDetailConfig.tabBarUnSelectedLabelStyle;

  BaseTextStyle get tabBarLabelStyle =>
      _tabBarLabelStyle ??
      BaseGalleryConfigUtils.defaultGalleryDetailConfig.tabBarLabelStyle;

  Color get tabBarBackgroundColor =>
      _tabBarBackgroundColor ??
      BaseGalleryConfigUtils.defaultGalleryDetailConfig.tabBarBackgroundColor;

  Color get pageBackgroundColor =>
      _pageBackgroundColor ??
      BaseGalleryConfigUtils.defaultGalleryDetailConfig.pageBackgroundColor;

  Color get bottomBackgroundColor =>
      _bottomBackgroundColor ??
      BaseGalleryConfigUtils.defaultGalleryDetailConfig.bottomBackgroundColor;

  BaseTextStyle get titleStyle =>
      _titleStyle ??
      BaseGalleryConfigUtils.defaultGalleryDetailConfig.titleStyle;

  BaseTextStyle get contentStyle =>
      _contentStyle ??
      BaseGalleryConfigUtils.defaultGalleryDetailConfig.contentStyle;

  BaseTextStyle get actionStyle =>
      _actionStyle ??
      BaseGalleryConfigUtils.defaultGalleryDetailConfig.actionStyle;

  Color get iconColor =>
      _iconColor ?? BaseGalleryConfigUtils.defaultGalleryDetailConfig.iconColor;

  @override
  void initThemeConfig(
    String configId, {
    BaseCommonConfig? currentLevelCommonConfig,
  }) {
    super.initThemeConfig(
      configId,
      currentLevelCommonConfig: currentLevelCommonConfig,
    );

    /// 用户全局组件配置
    GalleryDetailConfig galleryDetailConfig = BaseThemeConfig.instance
        .getConfig(configId: configId)
        .galleryDetailConfig;

    _appbarTitleStyle = galleryDetailConfig.appbarTitleStyle.merge(
      BaseTextStyle(
        color: commonConfig.colorTextBaseInverse,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_appbarTitleStyle),
    );
    _appbarActionStyle = galleryDetailConfig.appbarActionStyle.merge(
      _appbarActionStyle,
    );
    _appbarConfig ??= galleryDetailConfig.appbarConfig;
    _appbarBackgroundColor ??= galleryDetailConfig.appbarBackgroundColor;
    _tabBarUnSelectedLabelStyle = galleryDetailConfig.tabBarUnSelectedLabelStyle
        .merge(BaseTextStyle(fontSize: commonConfig.fontSizeSubHead))
        .merge(_tabBarUnSelectedLabelStyle);
    _tabBarLabelStyle = galleryDetailConfig.tabBarLabelStyle
        .merge(
          BaseTextStyle(
            color: commonConfig.colorTextBaseInverse,
            fontSize: commonConfig.fontSizeSubHead,
          ),
        )
        .merge(_tabBarLabelStyle);
    _tabBarBackgroundColor ??= galleryDetailConfig._tabBarBackgroundColor;
    _pageBackgroundColor ??= galleryDetailConfig._pageBackgroundColor;
    _bottomBackgroundColor ??= galleryDetailConfig._bottomBackgroundColor;
    _titleStyle = galleryDetailConfig.titleStyle
        .merge(
          BaseTextStyle(
            color: commonConfig.colorTextBaseInverse,
            fontSize: commonConfig.fontSizeHead,
          ),
        )
        .merge(_titleStyle);
    _contentStyle = galleryDetailConfig.contentStyle
        .merge(BaseTextStyle(fontSize: commonConfig.fontSizeBase))
        .merge(_contentStyle);
    _actionStyle = galleryDetailConfig.actionStyle
        .merge(
          BaseTextStyle(
            color: commonConfig.colorTextBaseInverse,
            fontSize: commonConfig.fontSizeBase,
          ),
        )
        .merge(_actionStyle);
    _iconColor ??= galleryDetailConfig._iconColor;
  }

  GalleryDetailConfig copyWith({
    BaseTextStyle? appbarTitleStyle,
    BaseTextStyle? appbarActionStyle,
    Color? appbarBackgroundColor,
    phoenix.AppBarConfig? appbarConfig,
    BaseTextStyle? tabBarUnSelectedLabelStyle,
    Color? tabBarUnselectedLabelColor,
    BaseTextStyle? tabBarLabelStyle,
    Color? tabBarLabelColor,
    Color? tabBarBackgroundColor,
    Color? indicatorColor,
    Color? pageBackgroundColor,
    Color? bottomBackgroundColor,
    BaseTextStyle? titleStyle,
    BaseTextStyle? contentStyle,
    BaseTextStyle? actionStyle,
    Color? iconColor,
  }) {
    return GalleryDetailConfig(
      appbarTitleStyle: appbarTitleStyle ?? _appbarTitleStyle,
      appbarActionStyle: appbarActionStyle ?? _appbarActionStyle,
      appbarBackgroundColor: appbarBackgroundColor ?? _appbarBackgroundColor,
      appbarConfig: appbarConfig ?? _appbarConfig,
      tabBarUnSelectedLabelStyle:
          tabBarUnSelectedLabelStyle ?? _tabBarUnSelectedLabelStyle,
      tabBarLabelStyle: tabBarLabelStyle ?? _tabBarLabelStyle,
      tabBarBackgroundColor: tabBarBackgroundColor ?? _tabBarBackgroundColor,
      pageBackgroundColor: pageBackgroundColor ?? _pageBackgroundColor,
      bottomBackgroundColor: bottomBackgroundColor ?? _bottomBackgroundColor,
      titleStyle: titleStyle ?? _titleStyle,
      contentStyle: contentStyle ?? _contentStyle,
      actionStyle: actionStyle ?? _actionStyle,
      iconColor: iconColor ?? _iconColor,
    );
  }

  GalleryDetailConfig merge(GalleryDetailConfig? other) {
    if (other == null) return this;
    return copyWith(
      appbarTitleStyle: appbarTitleStyle.merge(other._appbarTitleStyle),
      appbarActionStyle: appbarActionStyle.merge(other._appbarActionStyle),
      appbarBackgroundColor: other._appbarBackgroundColor,
      appbarConfig: other._appbarConfig,
      tabBarUnSelectedLabelStyle:
          tabBarUnSelectedLabelStyle.merge(other._tabBarUnSelectedLabelStyle),
      tabBarLabelStyle: tabBarLabelStyle.merge(other._tabBarLabelStyle),
      tabBarBackgroundColor: other._tabBarBackgroundColor,
      pageBackgroundColor: other._pageBackgroundColor,
      bottomBackgroundColor: other._bottomBackgroundColor,
      titleStyle: titleStyle.merge(other._titleStyle),
      contentStyle: contentStyle.merge(other._contentStyle),
      actionStyle: actionStyle.merge(other._actionStyle),
      iconColor: other._iconColor,
    );
  }
}
