import 'dart:convert';

import 'my_children.dart';

class MyData {
  String? after;
  String? before;
  int? dist;
  String? modhash;
  String? geoFilter;
  List<MyChildren> children;
  MyData({
    this.after,
    this.before,
    this.dist,
    this.modhash,
    this.geoFilter,
    required this.children,
  });

  Map<String, dynamic> toMap() {
    return {
      'after': after,
      'before': before,
      'dist': dist,
      'modhash': modhash,
      'geo_filter': geoFilter,
      'children': children.map((x) => x.toMap()).toList(),
    };
  }

  factory MyData.fromMap(Map<String, dynamic> map) {
    return MyData(
      after: map['after'],
      before: map['before'],
      dist: map['dist']?.toInt(),
      modhash: map['modhash'],
      geoFilter: map['geo_filter'],
      children: List<MyChildren>.from(
          map['children']?.map((x) => MyChildren.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MyData.fromJson(String source) => MyData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MyData(after: $after, before: $before, dist: $dist, modhash: $modhash, geoFilter: $geoFilter, children: $children)';
  }
}
