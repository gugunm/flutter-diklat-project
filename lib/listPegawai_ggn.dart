// src : https://www.digitalocean.com/community/tutorials/flutter-flutter-http
import 'dart:async';
import 'dart:convert';
import 'dart:ui';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Pegawai"),
      ),
      body: FutureBuilder<List<Pegawai>>(
        future: fetchPegawai(),
        builder: (BuildContext context, AsyncSnapshot<List<Pegawai>> snapshot) {
          if (snapshot.hasData) {
            List<Pegawai> pegawai = snapshot.data!;
            // return ListView(
            //   children: pegawai
            //       .map(
            //         (Pegawai pegawai) => ListTile(
            //           title: Text(pegawai.nama),
            //           subtitle: Text("${pegawai.nip}"),
            //         ),
            //       )
            //       .toList(),
            // );
            return ListView.separated(
              padding: EdgeInsets.all(5),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  // tileColor: Colors.amber[300],
                  title: Text(pegawai[index].nama),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        // title: ,
                        content: Container(
                          height: 200,
                          child: Column(
                            children: [
                              ClipOval(
                                child: Container(
                                  color: Colors.indigoAccent,
                                  height: 60.0,
                                  width: 60.0,
                                  child: Center(
                                    child: Text(
                                      pegawai[index].nama[0],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                pegawai[index].nama,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                pegawai[index].nip,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  leading: ClipOval(
                    child: Container(
                      color: Colors.indigoAccent,
                      height: 50.0,
                      width: 50.0,
                      child: Center(
                        child: Text(
                          pegawai[index].nama[0],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: snapshot.data!.length,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
