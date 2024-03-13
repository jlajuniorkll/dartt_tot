import 'package:dartt_tot/commons/components/body_commons.dart';
import 'package:dartt_tot/consts.dart';
import 'package:dartt_tot/page_routes/app_routes.dart';
import 'package:dartt_tot/pages/issues/components/issue_listtile.dart';
import 'package:dartt_tot/pages/issues/controller/issues_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IssuesScreen extends StatelessWidget {
  const IssuesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IssuesController>(builder: (controller) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: appBar,
        drawer: drawerCustom,
        body: controller.allGrupos.isNotEmpty
            ? BodyCommon(
                widget: ListView.builder(
                  itemCount: controller.allGrupos.length,
                  itemBuilder: (_, index) {
                    return IssueListTile(
                      groupReceived: controller.allGrupos[index],
                      indexGroup: index,
                    );
                  },
                ),
                title: "Lista Perguntas")
            : const BodyCommon(
                widget: Center(
                  child: Text(
                    "Nenhum grupo de perguntas cadastrado!",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: "Lista Perguntas"),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.toNamed(PageRoutes.issuesForm, arguments: [null, null]);
          },
          label: const Text(
            "Novo Grupo",
            style: TextStyle(color: Colors.white),
          ),
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    });
  }
}
