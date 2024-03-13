import 'dart:convert';

import 'package:dartt_tot/models/issue.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SubGrupo {
  String? id;
  String? order;
  String? title;
  String? obs;
  List<Issue>? issue;
  SubGrupo({
    this.id,
    this.order,
    this.title,
    this.obs,
    this.issue,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'order': order,
      'title': title,
      'obs': obs,
      'issue': issue?.map((x) => x.toMap()).toList(),
    };
  }

  factory SubGrupo.fromMap(Map<String, dynamic> map) {
    return SubGrupo(
      id: map['id'] != null ? map['id'] as String : null,
      order: map['order'] != null ? map['order'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      obs: map['obs'] != null ? map['obs'] as String : null,
      issue: map['issue'] != null
          ? List<Issue>.from(
              (map['issue'] as List<int>).map<Issue?>(
                (x) => Issue.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubGrupo.fromJson(String source) =>
      SubGrupo.fromMap(json.decode(source) as Map<String, dynamic>);
}
