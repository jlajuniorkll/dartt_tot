import 'package:dartt_tot/commons/alerts/alert_widget.dart';
import 'package:dartt_tot/models/answer.dart';
import 'package:dartt_tot/pages/answer/controllers/listanswer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnswerListTile extends StatelessWidget {
  const AnswerListTile(
      {super.key, required this.answerReceived, required this.indexGroup});

  final Answer answerReceived;
  final int indexGroup;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            answerReceived.cliente!,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            answerReceived.projeto!,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.find<ListAnswerController>()
                            .setDataQuestion(answerReceived);
                        /*Get.toNamed(PageRoutes.answer,
                            arguments: [answerReceived, indexGroup]);*/
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 4, right: 6),
                        child: Icon(Icons.checklist,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.find<IssuesController>().setDataForm(groupReceived);
                        /*Get.toNamed(PageRoutes.issuesForm,
                            arguments: [groupReceived, indexGroup]);*/
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 4, right: 6),
                        child: Icon(Icons.edit,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final confirm = await Get.dialog<bool>(AlertFetch(
                            title: 'Tem certeza?',
                            body:
                                'Deseja deletar o seguinte projeto: ${answerReceived.projeto} - ${answerReceived.cliente} ?'));
                        if (confirm == true) {
                          await Get.find<ListAnswerController>()
                              .deleteAnswer(indexGroup);
                          Get.snackbar('Exclusão:',
                              'Grupo ${answerReceived.projeto} - ${answerReceived.cliente} deletado com sucesso!',
                              snackPosition: SnackPosition.BOTTOM,
                              colorText: Colors.white,
                              backgroundColor: Colors.red,
                              duration: const Duration(seconds: 4),
                              margin: const EdgeInsets.only(bottom: 8));
                        }
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Icon(
                            Icons.delete,
                            color: Colors.red[600],
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
