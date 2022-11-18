import 'dart:convert';

import 'my_data_2.dart';

class MyChildren {
  String? kind;
  MyData2? data;
  MyChildren({
    this.kind,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'kind': kind,
      'data': data?.toMap(),
    };
  }

  factory MyChildren.fromMap(Map<String, dynamic> map) {
    return MyChildren(
      kind: map['kind'],
      data: map['data'] != null ? MyData2.fromMap(map['data']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyChildren.fromJson(String source) =>
      MyChildren.fromMap(json.decode(source));

  @override
  String toString() => 'MyChildren(kind: $kind, data: $data)';
}
