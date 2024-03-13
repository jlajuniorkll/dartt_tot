import 'package:dartt_tot/models/answer.dart';
import 'package:dartt_tot/models/grupo.dart';
import 'package:dartt_tot/models/question.dart';
import 'package:dartt_tot/page_routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListAnswerController extends GetxController {
  TextEditingController nameCliente = TextEditingController();
  TextEditingController nProjeto = TextEditingController();

  List<Answer> listQuestion = [];
  Answer answer = Answer();

  int index = 0;

  void finishAnswer(Grupo g) {
    listQuestion.add(Answer(
        cliente: nameCliente.text,
        projeto: nProjeto.text,
        question: Question(grupo: [g])));
    Get.back();
    update();
  }

  void setDataQuestion(Answer a) {
    answer = a;
    Get.toNamed(PageRoutes.answer);
    update();
  }

  void setIndex() {
    index++;
  }

  Future<void> deleteAnswer(int indexGroup) async {
    listQuestion.removeAt(indexGroup);
    update();
  }
}
