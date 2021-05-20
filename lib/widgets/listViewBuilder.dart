import 'package:flutter/material.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({
    required this.entries,
    required this.colorCodes,
  }) : super();

  final List<String> entries;
  final List<int> colorCodes;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            tileColor: Colors.amber[colorCodes[index]],
            title: Text('Warna Code ${entries[index]}'),
            leading: Icon(Icons.stop_circle),
          );
        },
      ),
    );
  }
}
