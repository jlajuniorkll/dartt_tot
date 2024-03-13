import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Issue {
  String? id;
  String? order;
  String? title;
  bool? status;
  bool? req;
  bool? reqMidia;
  bool? reqObs;
  String? resposta;
  String? obs;
  List<String>? midia;

  Issue({
    this.id,
    this.title,
    this.order,
    this.status,
    this.req,
    this.reqMidia,
    this.reqObs,
    this.resposta,
    this.obs,
    this.midia,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'order': order,
      'title': title,
      'status': status,
      'req': req,
      'reqMidia': reqMidia,
      'reqObs': reqObs,
      'resposta': resposta,
      'obs': obs,
      'midia': midia,
    };
  }

  factory Issue.fromMap(Map<String, dynamic> map) {
    return Issue(
      id: map['id'] != null ? map['id'] as String : null,
      order: map['order'] != null ? map['order'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      status: map['status'] != null ? map['status'] as bool : null,
      req: map['req'] != null ? map['req'] as bool : null,
      reqMidia: map['reqMidia'] != null ? map['reqMidia'] as bool : null,
      reqObs: map['reqObs'] != null ? map['reqObs'] as bool : null,
      resposta: map['resposta'] != null ? map['resposta'] as String : null,
      obs: map['obs'] != null ? map['obs'] as String : null,
      midia: map['midia'] != null
          ? List<String>.from((map['midia'] as List<String>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Issue.fromJson(String source) =>
      Issue.fromMap(json.decode(source) as Map<String, dynamic>);
}
