import 'package:flutter/material.dart';

class ResultNotice extends StatefulWidget {
  final Color color;
  final String info;

  const ResultNotice({Key? key, required this.color, required this.info})
      : super(key: key);

  @override
  State<ResultNotice> createState() => _ResultNoticeState();
}

class _ResultNoticeState extends State<ResultNotice>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ResultNotice oldWidget) {
    controller.forward(from: 0);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            color: widget.color,
            alignment: Alignment.center,
            child: AnimatedBuilder(
                animation: controller,
                builder: (_, child) {
                  print("Current fontSize: ${controller.value}");
                  return Text(
                    widget.info,
                    style: TextStyle(
                        fontSize: 54 * (controller.value),
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  );
                })));
  }
}
