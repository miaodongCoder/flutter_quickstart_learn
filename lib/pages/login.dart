import 'package:flutter/material.dart';
import 'package:flutter_quickstart_learn/common/index.dart';
import 'package:flutter_quickstart_learn/pages/ai_page.dart';

/// 登录页面
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 账号输入是否有效
  bool isUserNameValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSplash,
      body: SingleChildScrollView(child: _buildView(context)),
    );
  }

  // 主视图
  Widget _buildView(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 150, 15, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 图标
          Image.asset(
            AssetsImages.logoPng,
            width: 60,
          ),

          const SizedBox(height: 20),

          // 主标
          const Text(
            "AI",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          // 子标
          const Text(
            "欢迎来到 AI 的世界",
            style: TextStyle(
              fontSize: 13,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),

          const SizedBox(height: 50),

          // 表单
          _buildForm(context),
        ],
      ),
    );
  }

  // 登录表单
  Widget _buildForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Username or E-Mail
          const Text(
            "账号",
            style: TextStyle(
              fontSize: 15,
              color: Color(0xff838383),
              fontWeight: FontWeight.w300,
            ),
          ),
          TextField(
            onChanged: (value) {
              bool valid = false;
              if (value.length >= 6) {
                valid = true;
              } else {
                valid = false;
              }

              setState(() {
                isUserNameValid = valid;
              });
            },
            decoration: InputDecoration(
              hintText: "请输入 用户名 或 者邮箱",
              prefixIcon: Image.asset(
                AssetsImages.iconUserPng,
                width: 23,
                height: 23,
              ),
              suffixIcon: isUserNameValid == true
                  ? const Icon(
                      Icons.done,
                      color: Colors.green,
                    )
                  : null,
            ),
          ),

          // 间距
          const SizedBox(height: 35),

          // Password
          const Text(
            "密码:",
            style: TextStyle(
              fontSize: 15,
              color: Color(0xff838383),
              fontWeight: FontWeight.w300,
            ),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "请输入密码",
              prefixIcon: Image.asset(
                AssetsImages.iconLockPng,
                width: 23,
                height: 23,
              ),
              suffixIcon: TextButton(
                onPressed: () {},
                child: const Text(
                  "忘记密码?",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff0274bc),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),

          // 间距
          const SizedBox(height: 30),

          // Sign In
          ButtonWidget(
            text: '登    录',
            onPressed: () {
              onToAIPage(context);
            },
            height: 60,
            widget: double.infinity,
            radius: 18,
          ),

          // 间距
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 文字
              const Text(
                "还没有 AI 账号",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff171717),
                  fontWeight: FontWeight.w300,
                ),
              ),
              // 按钮
              TextButton(
                onPressed: () {},
                child: const Text(
                  "注册",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff0274bc),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onToAIPage(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const AIPage()));
  }
}
