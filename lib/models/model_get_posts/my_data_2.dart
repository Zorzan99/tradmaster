// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MyData2 {
  String selfText;
  String authorFullName;
  int created;
  int ups;
  int downs;
  bool? favorito;
  String idApi;
  MyData2(
      {required this.selfText,
      required this.authorFullName,
      required this.created,
      required this.ups,
      required this.downs,
      this.favorito,
      required this.idApi,
      });

  Map<String, dynamic> toMap() {
    return {
      'selftext': selfText,
      'author_fullname': authorFullName,
      'created': created,
      'ups': ups,
      'downs': downs,
      'id': idApi
    };
  }

  factory MyData2.fromMap(Map<String, dynamic> map) {
    return MyData2(
      selfText: map['selftext'] ?? '',
      authorFullName: map['author_fullname'] ?? '',
      created: map['created']?.toInt() ?? 0,
      ups: map['ups']?.toInt() ?? 0,
      downs: map['downs']?.toInt() ?? 0,
      favorito: map['favorito'] ?? false,
      idApi: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MyData2.fromJson(String source) =>
      MyData2.fromMap(json.decode(source));

 

  @override
  String toString() {
    return 'MyData2(selfText: $selfText, authorFullName: $authorFullName, created: $created, ups: $ups, downs: $downs, favorito: $favorito, id: $idApi)';
  }
}
