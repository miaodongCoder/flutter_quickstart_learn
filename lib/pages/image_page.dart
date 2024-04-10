import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quickstart_learn/common/assets.dart';
import 'package:flutter_quickstart_learn/common/extension/ex_widget.dart';

/// 四张结果图片页:
class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrnAppBar(
        title: "生 成 结 果",
      ),
      body: _buildMainView(),
    );
  }

  Widget _buildMainView() {
    return Image.asset(
      AssetsImages.iconLotusPng,
      height: 400,
      width: double.infinity,
      fit: BoxFit.fill,
    ).center();
  }
}
