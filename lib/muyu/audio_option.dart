import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class AudioOption {
  final String src;
  final String name;
  const AudioOption(this.name, this.src);
}

class AudioOptionItem extends StatelessWidget {
  final AudioOption audioOption;
  final bool active;

  const AudioOptionItem(
      {Key? key, required this.audioOption, required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(audioOption.name),
    );
  }
}

class AudioOptionPanel extends StatelessWidget {
  final List<AudioOption> audioOptions;
  final int activeIndex;
  final ValueChanged<int> onSelect;

  const AudioOptionPanel(
      {Key? key,
      required this.audioOptions,
      required this.activeIndex,
      required this.onSelect})
      : super(key: key);

  Widget _buildByIndex(int value) {
    print(value);
    bool active = value == activeIndex;
    return ListTile(
      onTap: () => onSelect(value),
      selected: active,
      title: Text(audioOptions[value].name),
      trailing: IconButton(
        onPressed: () => _tempPlay(audioOptions[value].src),
        icon: Icon(
          Icons.record_voice_over_rounded,
          color: Colors.blue,
        ),
      ),
    );
  }

  void _tempPlay(String src) async {
    AudioPool pool = await FlameAudio.createPool(src, maxPlayers: 1);
    pool.start();
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle labelStyle =
        TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    const EdgeInsets padding =
        EdgeInsets.symmetric(horizontal: 8, vertical: 16);
    // TODO: implement build
    return Material(
      child: SizedBox(
        height: 300,
        child: Column(
          children: [
            Container(
              height: 46,
              alignment: Alignment.center,
              child: Text(
                '选择音效',
                style: labelStyle,
              ),
            ),
            ...List.generate(audioOptions.length, _buildByIndex),
          ],
        ),
      ),
    );
  }
}
