import 'package:flutter/material.dart';
import 'package:wangdemo/menu/model/MenuData.dart';

class Appbottombar  extends StatelessWidget{
  final int currentIndex;//当前索引
  final List<MenuData> menus;//菜单数据
  final ValueChanged<int>? onItemTap;//点击事件

  const Appbottombar({Key? key,this.currentIndex=0,required this.menus,this.onItemTap}) : super(key: key);

  BottomNavigationBarItem _buildItembyMenuMate(MenuData menu){
    return BottomNavigationBarItem(icon: Icon(menu.icon),label: menu.label);

  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: menus.map(_buildItembyMenuMate).toList(),);
  }
}