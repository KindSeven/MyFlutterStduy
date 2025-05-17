import 'package:flutter/material.dart';

class CountPanel extends StatelessWidget {
  final int count;
  final VoidCallback onTapSwitchAudio;
  final VoidCallback onTapSwitchImage;

  const CountPanel(
      {Key? key,
      required this.count,
      required this.onTapSwitchAudio,
      required this.onTapSwitchImage})
      : super(key: key);
      
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final ButtonStyle style = ElevatedButton.styleFrom(
        minimumSize: const Size(36, 36),
        padding: EdgeInsets.zero,
        backgroundColor: Colors.green,
        elevation: 0);
    return Stack(
      children: [
        Center(
            child: Text(
          '功德数：$count',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        )),
        Positioned(
          right: 10,
          top: 10,
          child: Wrap(
            direction: Axis.vertical,
            spacing: 8,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.music_note_outlined,
                    color: Colors.white,
                  ),
                  style: style),
              ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.image, color: Colors.white),
                  style: style),
            ],
          ),
        ),
      ],
    );
  }
}
