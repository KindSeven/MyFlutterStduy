import 'package:flutter/material.dart';

Widget ResultNotice(Color color, String info) {
  return Expanded(
      child: Container(
    color: color,
    alignment: Alignment.center,
    child: Text(
      info,
      style: TextStyle(
          fontSize: 70, color: Colors.white, fontWeight: FontWeight.bold),
    ),
  ));
}
