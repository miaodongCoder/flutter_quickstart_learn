import 'package:flutter/material.dart';
import 'package:flutter_quickstart_learn/common/index.dart';
import 'package:flutter_quickstart_learn/pages/login.dart';

/// 欢迎页面
class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 标题
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 38),
            child: Text(
              "让我们一起跟着 陈老师 , \n带你体验 AI 的魅力~",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff2B2A2A),
              ),
            ),
          ),

          // 间距
          const SizedBox(height: 70),

          // 图
          Image.asset(
            AssetsImages.welcomePng,
            height: 300,
            width: double.infinity,
            fit: BoxFit.none,
          ),

          // 间距
          const SizedBox(height: 70),

          // 按钮
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                // skip
                TextButton(
                  onPressed: () => onToLogin(context),
                  child: const Text(
                    "跳过",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff2B2A2A),
                    ),
                  ),
                ),

                // 撑开
                const Expanded(
                  child: SizedBox(),
                ),

                // Get Started
                ButtonWidget(
                  text: "开始",
                  height: 42,
                  widget: 140,
                  radius: 32,
                  onPressed: () => onToLogin(context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void onToLogin(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
