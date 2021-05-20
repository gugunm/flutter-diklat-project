// src : https://www.digitalocean.com/community/tutorials/flutter-flutter-http
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/pegawai.dart';

Future<List<Pegawai>> fetchPegawai() async {
  await Future.delayed(Duration(seconds: 1));

  final res =
      await http.get(Uri.http('app.bpkp.go.id', 'apilatihan/pegawai.php'));

  if (res.statusCode == 200) {
    List<dynamic> body = jsonDecode(res.body);

    List<Pegawai> pegawai = body
        .map(
          (dynamic item) => Pegawai.fromJson(item),
        )
        .toList();

    return pegawai;
  } else {
    throw "Unable to retrieve data.";
  }
}

class ListPegawai extends StatelessWidget {
  final border = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Pegawai"),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: FutureBuilder(
          future: fetchPegawai(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Pegawai>> snapshot) {
            if (snapshot.hasData) {
              List<Pegawai> pegawai = snapshot.data!;
              return ListView.separated(
                // padding:  const EdgeInsets.all(10),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: border,
                    color: Colors.amber[300],
                    child: ListTile(
                      title: Text(pegawai[index].nama),
                      subtitle: Text(pegawai[index].nip),
                      leading: Icon(Icons.people),
                    ),
                  );
                },
                itemCount: pegawai.length,
                separatorBuilder: (BuildContext context, int index) =>
                    // const Divider()
                    Container(height: 0, color: Colors.white),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
