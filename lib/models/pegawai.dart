import 'dart:convert';

Pegawai pegawaiFromJson(String str) => Pegawai.fromJson(json.decode(str));

String pegawaiToJson(Pegawai data) => json.encode(data.toJson());

class Pegawai {
  Pegawai({
    required this.id,
    required this.nip,
    required this.nama,
  });

  String id;
  String nip;
  String nama;

  factory Pegawai.fromJson(Map<String, dynamic> json) => Pegawai(
        id: json["id"],
        nip: json["nip"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nip": nip,
        "nama": nama,
      };
}
