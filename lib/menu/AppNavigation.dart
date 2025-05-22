import 'package:flutter/material.dart';
import 'package:wangdemo/guess/guess_page.dart';
import 'package:wangdemo/menu/AppBottomBar.dart';
import 'package:wangdemo/menu/model/MenuData.dart';
import 'package:wangdemo/muyu/muyupage.dart';
import 'package:wangdemo/net_article/views/net_article_page.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({Key? key}) : super(key: key);

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation>  {
  final PageController _ctrl = PageController();
  int _index = 0;
  final List<MenuData> menus = const [
    MenuData(label: '猜数字', icon: Icons.question_mark),
    MenuData(label: '电子木鱼', icon: Icons.my_library_music_outlined),
    MenuData(label: '网络文章',icon: Icons.article_outlined)
  ];



  void _onChangePage(int index) {
    _ctrl.jumpToPage(index);
    setState(() {
      _index = index;
    });
  }

  Widget _buildContent() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _ctrl,
      children: [
        GuessPage(title: '222'),
        MuyuPage(),
        NetArticlePage()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Expanded(child: _buildContent()),
        Appbottombar(
          menus: menus,
          currentIndex: _index,
          onItemTap: _onChangePage,
        )
      ],
    );
  }
}
