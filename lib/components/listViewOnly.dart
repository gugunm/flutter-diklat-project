import 'package:flutter/material.dart';

class ListViewOnly extends StatelessWidget {
  const ListViewOnly({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        padding: EdgeInsets.all(10),
        children: [
          ListTile(
            title: Text('First text'),
            leading: Icon(Icons.stop_circle),
            trailing: Text('Metadata'),
          ),
          ListTile(
            title: Text('Second text'),
            leading: Icon(Icons.stop_circle),
            trailing: Text('Metadata'),
          ),
          ListTile(
            title: Text('Third text'),
            leading: Icon(Icons.stop_circle),
            trailing: Text('Metadata'),
          ),
          ListTile(
            title: Text('Forth text'),
            leading: Icon(Icons.stop_circle),
            trailing: Text('Metadata'),
          ),
        ],
      ),
    );
  }
}
