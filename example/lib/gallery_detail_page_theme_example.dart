/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2022-04-29 17:06:50
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-10-11 22:24:27
 * @FilePath: /phoenix_gallery/example/lib/gallery_detail_page_theme_example.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';

import 'gallery_detail_example.dart';
import 'list_item.dart';

class GalleryDetailPageThemeExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("图片详情查看"),
        ),
        body: CustomScrollView(slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            ListItem(
              title: "图片详情-白色主题",
              describe: "图片详情带白色主题",
              isShowLine: false,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return GalleryDetailExamplePage(
                      title: "图片详情-白色主题",
                      photoGalleryTheme: PhotoGalleryTheme.light,
                    );
                  },
                ));
              },
            ),
            ListItem(
              title: "图片详情-黑色主题",
              describe: "图片详情带黑色主题，默认黑色",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return GalleryDetailExamplePage(
                      title: "图片详情-黑色主题",
                      photoGalleryTheme: PhotoGalleryTheme.dark,
                    );
                  },
                ));
              },
            ),
          ]))
        ]));
  }
}
