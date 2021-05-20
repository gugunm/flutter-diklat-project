import 'package:flutter/material.dart';

class TitleLatListGrid extends StatelessWidget {
  final String textTitle;

  const TitleLatListGrid({
    required this.textTitle,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      color: Colors.indigo[100],
      child: Text(
        textTitle,
        textAlign: TextAlign.center,
      ),
      height: 50,
    );
  }
}
