
import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    this.id,
    this.kata,
    this.deskripsi,
    this.url,
    this.contoh,
    this.tglBuat,
  });

  String id;
  String kata;
  String deskripsi;
  String url;
  String contoh;
  DateTime tglBuat;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json["id"],
    kata: json["kata"],
    deskripsi: json["deskripsi"],
    url: json["url"],
    contoh: json["contoh"],
    tglBuat: DateTime.parse(json["tgl_buat"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "kata": kata,
    "deskripsi": deskripsi,
    "url": url,
    "contoh": contoh,
    "tgl_buat": tglBuat.toIso8601String(),
  };
}