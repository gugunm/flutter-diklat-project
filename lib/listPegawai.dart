import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/pegawai.dart';

class HttpService {
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
}

class ListPegawai extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: FutureBuilder(
        future: httpService.fetchPegawai(),
        builder: (BuildContext context, AsyncSnapshot<List<Pegawai>> snapshot) {
          if (snapshot.hasData) {
            List<Pegawai> pegawai = snapshot.data!;
            return ListView(
              children: pegawai
                  .map(
                    (Pegawai pegawai) => ListTile(
                      title: Text(pegawai.nama),
                      subtitle: Text("${pegawai.nip}"),
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
