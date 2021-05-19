import 'package:flutter/material.dart';
import 'components/listViewBuilder.dart';
import 'components/gridViewBuilder.dart';
import 'components/titleLatListGrid.dart';
import 'components/listViewSeparated.dart';
import 'components/listViewOnly.dart';
import 'components/gridViewOnly.dart';

class LatListView extends StatefulWidget {
  @override
  _LatListViewState createState() => _LatListViewState();
}

class _LatListViewState extends State<LatListView> {
  final List<String> entries = <String>[
    '600',
    '500',
    '400',
    '300',
    '200',
    '100'
  ];
  final List<int> colorCodes = <int>[600, 500, 400, 300, 200, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List and Grid View"),
        ),
        body: SafeArea(
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            color: Color(0xFFF5F5F5),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Contoh Latihan",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TitleLatListGrid(
                    textTitle: "ListView Builder",
                  ),
                  ListViewBuilder(
                    entries: entries,
                    colorCodes: colorCodes,
                  ),
                  TitleLatListGrid(
                    textTitle: "ListView Separated",
                  ),
                  ListViewSeparated(
                    entries: entries,
                    colorCodes: colorCodes,
                  ),
                  TitleLatListGrid(
                    textTitle: "ListView",
                  ),
                  ListViewOnly(),
                  TitleLatListGrid(
                    textTitle: "GridView",
                  ),
                  GridViewOnly(),
                  TitleLatListGrid(
                    textTitle: "GridView Builder",
                  ),
                  GridViewBuilder(entries: entries, colorCodes: colorCodes),
                ],
              ),
            ),
          ),
        ));
  }
}
