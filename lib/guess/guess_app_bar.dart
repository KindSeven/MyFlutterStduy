// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GuessAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GuessAppBar({Key? key, required this.onCheck, required this.controller})
      : super(key: key);
  final VoidCallback onCheck;
  final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark, //状态栏图标颜色为黑色
          statusBarColor: Colors.transparent), //状态栏背景颜色为透明
      leading: Icon(
        Icons.menu,
        color: Colors.black,
      ),
      title: TextField(
        controller: controller,
        keyboardType: TextInputType.number, //键盘类型: 数字
        decoration: InputDecoration(
            //装饰
            filled: true, //填充
            fillColor: Color(0xffF3F6F9), //填充颜色
            constraints: BoxConstraints(maxHeight: 35), //约束信息
            border: UnderlineInputBorder(
              //边线信息
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            hintText: "输入 0~99 数字", //提示字
            hintStyle: TextStyle(fontSize: 15) //提示字样式
            ),
      ),
      actions: [
        IconButton(
            splashRadius: 20,
            onPressed: onCheck,
            icon: Icon(
              Icons.run_circle_outlined,
              color: Colors.blue,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
