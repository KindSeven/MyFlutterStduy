import 'package:flutter/material.dart';

class MuyuAssetsImage extends StatelessWidget {
  final VoidCallback onTap;
  final String image;
  const MuyuAssetsImage({Key? key,required this.onTap,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
          onTap: onTap,
      child: Image.asset(
        image,
        height: 200,
      ),
    ));
  }
}
