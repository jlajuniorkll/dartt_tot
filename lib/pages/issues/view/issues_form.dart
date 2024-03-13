import 'package:dartt_tot/commons/components/body_commons.dart';
import 'package:dartt_tot/commons/components/custom_textfield.dart';
import 'package:dartt_tot/consts.dart';
import 'package:dartt_tot/pages/issues/components/rissues_listtile.dart';
import 'package:dartt_tot/pages/issues/components/subgrup_form.dart';
import 'package:dartt_tot/pages/issues/controller/issues_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class IssuesForm extends StatelessWidget {
  IssuesForm({super.key});

  final reCeived = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    if (reCeived[0] != null) {
      Get.find<IssuesController>().setGrupo(reCeived);
    }
    return PopScope(
      onPopInvoked: (didPop) async {
        Get.find<IssuesController>().limparTudo();
      },
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: appBar,
          body: BodyCommon(
              title: "Cadastrar Perguntas",
              widget: Container(
                margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 40.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: SingleChildScrollView(
                    child: GetBuilder<IssuesController>(builder: (controller) {
                  return Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Grupo",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        CustomTextField(
                          label: "Nome do Grupo",
                          iniValue: controller.grupo.title ?? "",
                          onSaved: ((newValue) =>
                              controller.grupo.title = newValue),
                          validator: (ng) {
                            if (ng!.isEmpty) {
                              return 'O nome é obrigatório';
                            } else {
                              return null;
                            }
                          },
                        ),
                        CustomTextField(
                          iniValue: controller.grupo.obs ?? "",
                          label: "Descrição do Grupo",
                          onSaved: ((newValue) =>
                              controller.grupo.obs = newValue),
                          validator: (dg) {
                            if (dg!.isEmpty) {
                              return 'A descrição é obrigatória';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Sub-Grupos",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        if (controller.grupo.subgrupo != null &&
                            controller.grupo.subgrupo!.isNotEmpty)
                          ReorderableListView.builder(
                            key: UniqueKey(),
                            shrinkWrap: true,
                            itemCount: controller.grupo.subgrupo!.length,
                            itemBuilder: (_, index) {
                              return RIssuesListTile(
                                key: ValueKey(index),
                                subGupoReceived:
                                    controller.grupo.subgrupo![index],
                                indexSBGruoup: index,
                              );
                            },
                            onReorder: (oldIndex, newIndex) {
                              Get.find<IssuesController>()
                                  .reorderStatus(oldIndex, newIndex);
                            },
                          ),
                        IconButton(
                            onPressed: () {
                              Get.dialog(const SubGrupForm());
                            },
                            icon: const Icon(
                              Icons.add_rounded,
                            )),
                        controller.grupo.title != null
                            ? ElevatedButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    await controller.atualizaTudo();
                                    Get.back();
                                  }
                                },
                                child: const Text("Atualizar"))
                            : ElevatedButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    await controller.finalizaTudo();
                                    Get.back();
                                  }
                                },
                                child: const Text("Finalizar")),
                      ],
                    ),
                  );
                })),
              ))),
    );
  }
}
