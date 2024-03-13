// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dartt_tot/models/subgrupo.dart';

class Grupo {
  String? id;
  String? order;
  String? title;
  String? obs;
  List<SubGrupo>? subgrupo;

  Grupo({
    this.id,
    this.order,
    this.title,
    this.obs,
    this.subgrupo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'order': order,
      'title': title,
      'obs': obs,
      'subgrupo': subgrupo?.map((x) => x.toMap()).toList(),
    };
  }

  factory Grupo.fromMap(Map<String, dynamic> map) {
    return Grupo(
      id: map['id'] != null ? map['id'] as String : null,
      order: map['order'] != null ? map['order'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      obs: map['obs'] != null ? map['obs'] as String : null,
      subgrupo: map['subgrupo'] != null
          ? List<SubGrupo>.from(
              (map['subgrupo'] as List<int>).map<SubGrupo?>(
                (x) => SubGrupo.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Grupo.fromJson(String source) =>
      Grupo.fromMap(json.decode(source) as Map<String, dynamic>);
}
