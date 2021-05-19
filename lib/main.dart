import 'package:flutter/material.dart';
import 'package:flutter_latsar_bpkp_tugas_dua/listPegawai.dart';
import 'textView.dart';
import 'latListView.dart';
import 'fetchApi.dart';
import 'listPegawai.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: 'Tugas 2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title}) : super();
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();

  bool _validate = false;

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: Color(0xFFF2F2F2),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      controller: myController,
                      decoration: InputDecoration(
                        labelText: 'Tuliskan Teks',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.text_fields,
                        ),
                        errorText:
                            _validate ? 'Teks tidak boleh kosong..' : null,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          myController.text.isNotEmpty
                              ? _validate = false
                              : _validate = true;
                        });
                        if (!_validate) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TextView(
                                textFromHome: myController.text,
                              ),
                            ),
                          );
                        }
                      },
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(myController.text),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo[500],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 13),
                        child: Text('Color Picker'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LatListView()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[400],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 13),
                        child: Text('List View'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: Text('Yay! A SnackBar!'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green[400],
                      ),
                      child: Text('SnackBar'),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FetchApi()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.cyan,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 13),
                        child: Text('Fetch API'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListPegawai()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 13),
                        child: Text('Profil Pegawai'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
