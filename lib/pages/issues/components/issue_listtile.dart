import 'package:dartt_tot/commons/alerts/alert_widget.dart';
import 'package:dartt_tot/models/grupo.dart';
import 'package:dartt_tot/page_routes/app_routes.dart';
import 'package:dartt_tot/pages/issues/controller/issues_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class IssueListTile extends StatelessWidget {
  IssueListTile(
      {super.key, required this.groupReceived, required this.indexGroup});

  Grupo groupReceived;
  int indexGroup;

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
                            groupReceived.title!,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            groupReceived.obs!,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.find<IssuesController>().setDataForm(groupReceived);
                        Get.toNamed(PageRoutes.issuesForm,
                            arguments: [groupReceived, indexGroup]);
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
                                'Deseja deletar o seguinte grupo: ${groupReceived.title} ?'));
                        if (confirm == true) {
                          await Get.find<IssuesController>()
                              .deleteTypeOcurrency(indexGroup);
                          Get.snackbar('Exclusão:',
                              'Grupo ${groupReceived.title} deletado com sucesso!',
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
