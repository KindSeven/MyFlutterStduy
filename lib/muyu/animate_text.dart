import 'package:flutter/material.dart';
import 'package:wangdemo/muyu/merit_record.dart';

class AnimateText extends StatefulWidget {
  final String text;
  final MeritRecord record;
  const AnimateText({Key? key, required this.text, required this.record})
      : super(key: key);

  @override
  State<AnimateText> createState() => _AnimateTextState();
}

class _AnimateTextState extends State<AnimateText>
    with SingleTickerProviderStateMixin {
  //with SingleTickerProviderStateMixin用于创建动画控制器
  late Animation<double> opacity; //动画对象，用来控制透明度
  late AnimationController controller; //动画控制器，用来控制动画的开始、结束、暂停等
  late Animation<Offset> position; //动画对象，用来控制位置
  late Animation<double> scale; //动画对象，用来控制大小

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    opacity = Tween<double>(begin: 0, end: 1).animate(controller);
    position = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
        .animate(controller);
    scale = Tween<double>(begin: 1.0, end: 0.9).animate(controller);
    controller.forward(); //开始动画
  }

  @override
  void didUpdateWidget(covariant AnimateText oldWidget) {
    super.didUpdateWidget(oldWidget);
      controller.forward(from: 0);
    
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      //scale动画，用来控制大小
      scale: scale,
      child: SlideTransition(
        position: position, //slide动画，用来控制位置
        child: FadeTransition(
          //fade动画，用来控制透明度
          opacity: opacity,
          child: Text(
            widget.text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
