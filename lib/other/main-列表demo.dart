import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MessagePage(),
    );
  }
}

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("消息"),
      ),
      body: ListView(
        children: const [
          MessageItem("http://doubibiji.com/open-assets/img/telangpu.jpg",
              "特朗普", "拜登今天肯定拉在裤裆里啦"),
          MessageItem("http://doubibiji.com/open-assets/img/pujing.jpg", "普京",
              "你怎么知道的"),
          MessageItem("http://doubibiji.com/open-assets/img/baideng.jpg", "拜登",
              "胡说，不是今天"),
        ],
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  final String name;
  final String message;
  final String fakeImg;
  const MessageItem(this.fakeImg, this.name, this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        children: [
          Image.network(
            fakeImg,
            width: 60,
            height: 60,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                message,
                style: TextStyle(
                    fontSize: 14, color: Color.fromARGB(255, 100, 100, 100)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
