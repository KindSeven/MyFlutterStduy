import 'package:flutter/material.dart';

class MuyuAppBar extends StatelessWidget implements PreferredSizeWidget{
  final VoidCallback _toHistroy;
  const MuyuAppBar({Key? key,required VoidCallback toHistroy}) : _toHistroy = toHistroy, super(key: key);




  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('赛博木鱼'),
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        IconButton(onPressed: _toHistroy,icon:const Icon(Icons.history)),
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

