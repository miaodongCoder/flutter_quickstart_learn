import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quickstart_learn/common/extension/ex_widget.dart';
import 'package:flutter_quickstart_learn/common/extension/widget_extension.dart';
import 'package:flutter_quickstart_learn/pages/image_page.dart';

/// AI 绘制页:
class AIPage extends StatefulWidget {
  const AIPage({Key? key}) : super(key: key);

  @override
  State<AIPage> createState() => _AIPageState();
}

class _AIPageState extends State<AIPage> {
  Color blueColor = const Color(0xff5590f6);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrnAppBar(
        brightness: Brightness.light,
        automaticallyImplyLeading: true,
        title: "创 作 中 心",
      ),
      body: _buildMainView(),
    );
  }

  // 主视图
  Widget _buildMainView() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildListView(),
          _buildBottomButtonPanel(),
        ],
      ),
    );
  }

  Widget _buildBottomButtonPanel() {
    return BrnBottomButtonPanel(
      mainButtonName: '生成 AI 模型',
      mainButtonOnTap: () {
        Duration duration = const Duration(seconds: 5);
        BrnToast.show(
          "生成 AI 模型中 , 请稍等片刻...",
          context,
          duration: duration,
          radius: 12,
          textStyle: const TextStyle(fontSize: 18),
        );

        Future.delayed(duration, () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ImagePage()));
        });
      },
      iconButtonList: [
        //构造Icon按钮
        BrnVerticalIconButton(
          name: '清除',
          iconWidget: const Icon(Icons.delete_outline),
          onTap: () {
            debugPrint("清除按钮被点击");
            controller.clear();
          },
        )
      ],
    );
  }

  /// AI 列表:
  Widget _buildListView() {
    return ListView(
      children: [
        _buildHeader(title: "绘画描述"),
        _buildTextView(),
        _buildHeader(title: "选择模型"),
        _buildSelectedModel(),
        _buildHeader(title: "绘图模式"),
        _buildDrawMode(),
      ],
    ).expanded();
  }

  /// 构建头视图:
  Widget _buildHeader({required String title}) {
    return <Widget>[
      const SizedBox(height: 10),
      <Widget>[
        _buildBlueGapLineWidget(),
        const SizedBox(width: 10),
        _buildTitle(title),
      ].toRow(),
      const SizedBox(height: 10),
    ].toColumn();
  }

  /// 左侧蓝条:
  Widget _buildBlueGapLineWidget({double? top}) {
    return Container(
      margin: EdgeInsets.only(
        top: top ?? 0,
      ),
      width: 4,
      height: 16,
      decoration: BoxDecoration(
        color: blueColor,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(2),
          topRight: Radius.circular(2),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  /// 绘画描述:
  Widget _buildTextView() {
    return BrnInputText(
      maxHeight: 200,
      minHeight: 30,
      minLines: 1,
      maxLength: 200,
      autoFocus: true,
      borderRadius: 10,
      borderColor: blueColor,
      focusNode: primaryFocus,
      bgColor: Colors.grey[200]!,
      textString: "",
      textInputAction: TextInputAction.newline,
      maxHintLines: 20,
      hint: '请陈老师在此填写想要的绘画关键词 , 我将全力以赴绘制您要的图片~',
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      onTextChange: (text) {
        debugPrint(text);
      },
      onSubmit: (text) {
        debugPrint(text);
      },
      textEditingController: controller,
    );
  }

  // 选择模型:
  Widget _buildSelectedModel() {
    List<String> tagList = ['真实细节', '动漫增强', '艺术增强', '动漫质感', '真实质感'];
    return BrnSelectTag(
      tags: tagList,
      isSingleSelect: false,
      spacing: 10,
      verticalSpacing: 10,
      selectedTagBackgroundColor: blueColor,
      tagBackgroundColor: Colors.grey[200],
    );
  }

  // 绘图模式:
  Widget _buildDrawMode() {
    List<String> tagList = ['快速模式', '普通模式'];
    return BrnSelectTag(
      tags: tagList,
      isSingleSelect: true,
      spacing: 10,
      verticalSpacing: 10,
      selectedTagBackgroundColor: blueColor,
      tagBackgroundColor: Colors.grey[200],
    );
  }
}
