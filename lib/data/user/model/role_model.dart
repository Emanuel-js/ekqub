import 'dart:convert';

import 'dart:developer';

class RoleModel {
  int? id;
  String? name;
  RoleModel({
    this.id,
    this.name,
  });

  RoleModel copyWith({
    int? id,
    String? name,
  }) {
    return RoleModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }

    return result;
  }

  RoleModel.fromMap(Map<String, dynamic> map) {
    log("inside role model from map");
    id = map['id'];
    name = map['name'];
  }

  String toJson() => json.encode(toMap());

  factory RoleModel.fromJson(String source) =>
      RoleModel.fromMap(json.decode(source));

  @override
  String toString() => 'RoleModel(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RoleModel && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
