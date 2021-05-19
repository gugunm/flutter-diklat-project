import 'package:flutter/material.dart';

class TombolWarna extends StatefulWidget {
  final Color warnaBackground;
  final Function(Color) callback;

  TombolWarna(this.warnaBackground, this.callback);

  @override
  _TombolWarnaState createState() => _TombolWarnaState();
}

class _TombolWarnaState extends State<TombolWarna> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.callback(widget.warnaBackground); //call to parent
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        color: widget.warnaBackground,
        child: SizedBox(
          width: 70,
          height: 70,
        ),
      ),
    );
  }
}
