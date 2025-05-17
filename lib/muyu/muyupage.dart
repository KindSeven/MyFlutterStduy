import 'dart:math';

import 'package:flutter/material.dart';
import 'muyu_AppBar.dart';
import 'count_panel.dart';
import 'muyu_assets_image.dart';

class MuyuPage extends StatefulWidget {
  const MuyuPage({Key? key}) : super(key: key);

  @override
  State<MuyuPage> createState() => _MuyuPageState();
}

class _MuyuPageState extends State<MuyuPage> {
  int _count = 0;
  final Random _random = Random();
  void onTapSwitchAudio() {}

  void onTapSwitchImage() {}

  void _toHistory() {}

  void _onKnock() {
    print(222);
    setState(() {
      int addCount = 1 + _random.nextInt(3);
      _count += addCount;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MuyuAppBar(),
        body: Column(
          children: [
            Text('MuyuPage'),
            Expanded(
                child: CountPanel(
                    count: _count,
                    onTapSwitchAudio: onTapSwitchAudio,
                    onTapSwitchImage: onTapSwitchImage)),
            Expanded(
                child: MuyuAssetsImage(
              image: 'assets/images/muyu.png',
              onTap: _onKnock,
            ))
          ],
        ));
  }
}
