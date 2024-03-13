// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dartt_tot/models/grupo.dart';

class Question {
  String? id;
  List<Grupo>? grupo;
  DateTime? createdAt;
  List<DateTime>? modified;
  Question({
    this.id,
    this.grupo,
    this.createdAt,
    this.modified,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'grupo': grupo?.map((x) => x.toMap()).toList(),
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'modified': modified?.map((x) => x.millisecondsSinceEpoch).toList(),
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] != null ? map['id'] as String : null,
      grupo: map['grupo'] != null
          ? List<Grupo>.from(
              (map['grupo'] as List<int>).map<Grupo?>(
                (x) => Grupo.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
          : null,
      modified: map['modified'] != null
          ? List<DateTime>.from(
              (map['modified'] as List<int>).map<DateTime?>(
                (x) => DateTime.fromMillisecondsSinceEpoch(x),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source) as Map<String, dynamic>);
}
