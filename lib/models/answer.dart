// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dartt_tot/models/question.dart';

class Answer {
  String? cliente;
  String? projeto;
  Question? question;
  String? userReponse;
  String? assResponse;
  String? userConfirm;
  String? assconfirm;

  Answer({
    this.cliente,
    this.projeto,
    this.question,
    this.userReponse,
    this.assResponse,
    this.userConfirm,
    this.assconfirm,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cliente': cliente,
      'projeto': projeto,
      'question': question?.toMap(),
      'userReponse': userReponse,
      'assResponse': assResponse,
      'userConfirm': userConfirm,
      'assconfirm': assconfirm,
    };
  }

  factory Answer.fromMap(Map<String, dynamic> map) {
    return Answer(
      cliente: map['cliente'] != null ? map['cliente'] as String : null,
      projeto: map['projeto'] != null ? map['projeto'] as String : null,
      question: map['question'] != null
          ? Question.fromMap(map['question'] as Map<String, dynamic>)
          : null,
      userReponse:
          map['userReponse'] != null ? map['userReponse'] as String : null,
      assResponse:
          map['assResponse'] != null ? map['assResponse'] as String : null,
      userConfirm:
          map['userConfirm'] != null ? map['userConfirm'] as String : null,
      assconfirm:
          map['assconfirm'] != null ? map['assconfirm'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Answer.fromJson(String source) =>
      Answer.fromMap(json.decode(source) as Map<String, dynamic>);
}
