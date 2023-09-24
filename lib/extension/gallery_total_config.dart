/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2023-09-24 18:15:39
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-09-24 18:27:54
 * @FilePath: /phoenix_gallery/lib/extension/gallery_total_config.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:phoenix_base/phoenix.dart';

import '../config/gallery_detail_config.dart';
import 'gallery_default_config_utils.dart';

class GalleryTotalConfig extends BaseTotalConfig {
  GalleryTotalConfig({GalleryDetailConfig? galleryDetailConfig})
      : _galleryDetailConfig = galleryDetailConfig;

  GalleryDetailConfig? _galleryDetailConfig;

  GalleryDetailConfig get galleryDetailConfig =>
      _galleryDetailConfig ?? BaseGalleryConfigUtils.defaultGalleryDetailConfig;

  @override
  void initThemeConfig(String configId) {
    super.initThemeConfig(configId);
    _galleryDetailConfig ??= GalleryDetailConfig();
    galleryDetailConfig.initThemeConfig(
      configId,
      currentLevelCommonConfig: commonConfig,
    );
  }
}

extension BaseTabBarTotalConfig on BaseTotalConfig {
  static GalleryDetailConfig? _galleryDetailConfig;

  ///
  GalleryDetailConfig get galleryDetailConfig =>
      _galleryDetailConfig ?? BaseGalleryConfigUtils.defaultGalleryDetailConfig;

  ///
  set tabBarTotalConfig(GalleryTotalConfig config) {
    _galleryDetailConfig = config.galleryDetailConfig;
  }
}
