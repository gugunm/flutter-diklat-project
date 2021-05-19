import 'package:flutter/material.dart';

class GridViewBuilder extends StatelessWidget {
  const GridViewBuilder({
    Key key,
    @required this.entries,
    @required this.colorCodes,
  }) : super(key: key);

  final List<String> entries;
  final List<int> colorCodes;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: GridView.builder(
          primary: false,
          padding: const EdgeInsets.all(20),
          itemCount: entries.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (BuildContext context, index) {
            return Container(
              alignment: Alignment.center,
              child: Text(entries[index]),
              decoration: BoxDecoration(
                  color: Colors.blue[colorCodes[index]],
                  borderRadius: BorderRadius.circular(5)),
            );
          }),
    );
  }
}
