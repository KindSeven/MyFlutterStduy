import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'guess_app_bar.dart';
import 'result_notice.dart';

class GuessPage extends StatefulWidget {
  const GuessPage({super.key, required this.title});

  final String title;

  @override
  State<GuessPage> createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  int _value = 0;
  bool _guessing = false;
  Random _random = Random();
  TextEditingController _guessCtrl = TextEditingController();
  bool? _isBig;
  @override
  void dispose() {
    _guessCtrl.dispose();
    super.dispose();
  }

  void _onCheck() {
    print('check_value:$_value------${_guessCtrl.text}');

    int? guessValue = int.tryParse(_guessCtrl.text);
    if (!_guessing || guessValue == null) return;

    if (guessValue == _value) {
      setState(() {
        _isBig = null;
        _guessing = false;
      });
      return;
    }

    setState(() {
      _isBig = guessValue > _value;
    });
  }

  void _generateRandomValue() {
    setState(() {
      _guessing = true;
      _value = _random.nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuessAppBar(
        onCheck: _onCheck,
        controller: _guessCtrl,
      ),
      body: Stack(
        children: [
          if (_isBig != null)
            Column(
              children: [
                if (_isBig!) ResultNotice(color: Colors.redAccent, info: '大了'),
                Spacer(),
                if (!_isBig!)
                  ResultNotice(color: Colors.blueAccent, info: '小了'),
              ],
            ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (_guessing)
                  const Text(
                    '点击生成随机数值',
                  ),
                Text(
                  _guessing ? '**' : '$_value',
                  style: const TextStyle(
                      fontSize: 68, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _guessing ? null : _generateRandomValue,
        tooltip: 'Increment',
        child: const Icon(Icons.generating_tokens_outlined),
        backgroundColor: _guessing ? Colors.grey : Colors.blue,
      ),
    );
  }
}
