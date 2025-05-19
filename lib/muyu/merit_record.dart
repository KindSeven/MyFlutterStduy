import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MeritRecord {
  final String id;
  final int timestamp;
  final String iamge;
  final String audio;
  final int value;

  const MeritRecord(
    this.id,
    this.timestamp,
    this.value,
    this.iamge,
    this.audio,
  );
}

class RecordHistory extends StatelessWidget {
  final List<MeritRecord> records;
  const RecordHistory({Key? key, required this.records}) : super(key: key);

  PreferredSizeWidget _buildAppBar() => AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          '功德记录',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );

  Widget _buildItem(BuildContext context, int index) {
    DateFormat format = DateFormat("yyyy-MM-dd HH:mm:ss");
    MeritRecord merit = records[index];
    String date =
        format.format(DateTime.fromMillisecondsSinceEpoch(merit.timestamp));
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        backgroundImage: AssetImage(merit.iamge),
      ),
      title: Text("功德+${merit.value}"),
      subtitle: Text(merit.audio),
      trailing: Text(
        date,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _buildAppBar(),
      body: records.isEmpty
          ? const Center(
              child: Text(
                '暂无功德记录',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemBuilder: _buildItem,
              itemCount: records.length,
            ),
    );
  }
}
