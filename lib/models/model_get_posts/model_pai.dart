import 'dart:convert';

import 'package:trademaster/models/model_get_posts/my_data.dart';

class ModelPai {
  String kind;
  MyData data;
  ModelPai({
    required this.kind,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'kind': kind,
      'data': data.toMap(),
    };
  }

  factory ModelPai.fromMap(Map<String, dynamic> map) {
    return ModelPai(
      kind: map['kind'] ?? '',
      data: MyData.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelPai.fromJson(String source) =>
      ModelPai.fromMap(json.decode(source));

  @override
  String toString() => 'ModelPai(kind: $kind, data: $data)';
}
