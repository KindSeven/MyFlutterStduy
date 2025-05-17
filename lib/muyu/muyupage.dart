import 'dart:math';

import 'package:flutter/material.dart';
import 'muyu_AppBar.dart';
import 'count_panel.dart';
import 'muyu_assets_image.dart';
import 'package:flame_audio/flame_audio.dart';
import 'animate_text.dart';

class MuyuPage extends StatefulWidget {
  const MuyuPage({Key? key}) : super(key: key);

  @override
  State<MuyuPage> createState() => _MuyuPageState();
}

class _MuyuPageState extends State<MuyuPage> {
  int _count = 0;
  final Random _random = Random();
  AudioPool? pool;
  int _cruValue = 0;

  void onTapSwitchAudio() {}

  void onTapSwitchImage() {}

  void _toHistory() {}

  void _onKnock() {
    pool?.start();
    setState(() {
      _cruValue = 1 + _random.nextInt(3);
      _count += _cruValue;
    });
  }

  void _initAudioPool() async {
    pool = await FlameAudio.createPool('muyu_3.mp3', maxPlayers: 4);
  }

  @override
  void initState() {
    super.initState();
    _initAudioPool();
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
                child: Stack(alignment: Alignment.topCenter, children: [
              MuyuAssetsImage(
                image: 'assets/images/muyu.png',
                onTap: _onKnock,
              ),
              if (_cruValue != 0) AnimateText(text: '功德+$_cruValue')
            ]))
          ],
        ));
  }
}
