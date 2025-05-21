import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:wangdemo/muyu/merit_record.dart';
import 'muyu_AppBar.dart';
import 'count_panel.dart';
import 'muyu_assets_image.dart';
import 'package:flame_audio/flame_audio.dart';
import 'animate_text.dart';
import 'image_option.dart';
import 'audio_option.dart';

class MuyuPage extends StatefulWidget {
  const MuyuPage({Key? key}) : super(key: key);

  @override
  State<MuyuPage> createState() => _MuyuPageState();
}

class _MuyuPageState extends State<MuyuPage>
    with AutomaticKeepAliveClientMixin {
  int _count = 0;
  final Random _random = Random();
  AudioPool? pool;
  int _cruValue = 0;
  final List<ImageOption> imageOptions = const [
    ImageOption('基础版', 'assets/images/muyu.png', 1, 3),
    ImageOption('尊享版', 'assets/images/muyu_2.png', 3, 6)
  ];
  int _activeimageIndex = 0;
  int _activeAudioIndex = 0;
  String get activeImage => imageOptions[_activeimageIndex].src;
  String get activeAudio => audioOptions[_activeAudioIndex].src;
  final List<AudioOption> audioOptions = const [
    AudioOption('音效1', 'muyu_1.mp3'),
    AudioOption('音效2', 'muyu_2.mp3'),
    AudioOption('音效3', 'muyu_3.mp3'),
  ];
  final List<MeritRecord> _record = [];
  final Uuid uuid = Uuid();
  MeritRecord? _curRecord;

  @override
  bool get wantKeepAlive => true;

  int get knockValue {
    int min = imageOptions[_activeimageIndex].min;
    int max = imageOptions[_activeimageIndex].max;
    return _random.nextInt(max + 1 - min) + min;
  }

  void _onSelectImage(int value) {
    Navigator.of(context).pop();
    if (value == _activeimageIndex) return;
    setState(() {
      _activeimageIndex = value;
    });
  }

  void _onSelectAudio(int value) async {
    Navigator.of(context).pop();
    print(activeAudio);
    if (value == _activeAudioIndex) return;

    _activeAudioIndex = value;
    pool = await FlameAudio.createPool(activeAudio, maxPlayers: 1);
  }

  void onTapSwitchAudio() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return AudioOptionPanel(
            audioOptions: audioOptions,
            activeIndex: _activeAudioIndex,
            onSelect: _onSelectAudio,
          );
        });
  }

  void onTapSwitchImage() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return ImageOptionPanel(
            imageOptions: imageOptions,
            activeIndex: _activeimageIndex,
            onSelect: _onSelectImage,
          );
        });
  }

  void _toHistory() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => RecordHistory(records: _record.reversed.toList())));
  }

  void _onKnock() {
    pool?.start();
    setState(() {
      _cruValue = knockValue;
      _count += _cruValue;

      String id = uuid.v4();
      _curRecord = MeritRecord(id, DateTime.now().millisecondsSinceEpoch,
          _cruValue, activeImage, audioOptions[_activeAudioIndex].name);
      _record.add(_curRecord!);
    });
    // print( _record);
  }

  void _initAudioPool() async {
    pool = await FlameAudio.createPool('muyu_1.mp3', maxPlayers: 1);
  }

  @override
  void initState() {
    super.initState();
    _initAudioPool();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: MuyuAppBar(
          toHistroy: _toHistory,
        ),
        body: Column(
          children: [
            // Text('MuyuPage'),
            Expanded(
                child: CountPanel(
                    count: _count,
                    onTapSwitchAudio: onTapSwitchAudio,
                    onTapSwitchImage: onTapSwitchImage)),
            Expanded(
                child: Stack(alignment: Alignment.topCenter, children: [
              MuyuAssetsImage(
                image: activeImage,
                onTap: _onKnock,
              ),
              if (_cruValue != 0)
                AnimateText(
                  text: '功德+$_cruValue',
                  record: _curRecord!,
                )
            ]))
          ],
        ));
  }
}
