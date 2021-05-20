import 'package:flutter/material.dart';
import 'widgets/tombolWarna.dart';

class TextView extends StatefulWidget {
  final String textFromHome;

  const TextView({required this.textFromHome}) : super();

  @override
  _TextViewState createState() => _TextViewState();
}

class _TextViewState extends State<TextView> {
  Color warnaBackground = Colors.amber;

  callback(newBgColor) {
    setState(() {
      warnaBackground = newBgColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Text"),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            color: Color(0xFFF2F2F2),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  color: warnaBackground,
                  padding: EdgeInsets.all(75),
                  child: Text(
                    widget.textFromHome,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    "Pilih warna background",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TombolWarna(Colors.amber, callback),
                        TombolWarna(Colors.teal, callback),
                        TombolWarna(Colors.brown, callback),
                        TombolWarna(Colors.red, callback),
                        TombolWarna(Colors.purple, callback),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
