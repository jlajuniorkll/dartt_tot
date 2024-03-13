import 'package:dartt_tot/commons/components/body_commons.dart';
import 'package:dartt_tot/commons/components/custom_textfield.dart';
import 'package:dartt_tot/consts.dart';
import 'package:dartt_tot/models/grupo.dart';
import 'package:dartt_tot/pages/answer/controllers/listanswer_controller.dart';
import 'package:dartt_tot/pages/issues/controller/issues_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormAnswer extends StatelessWidget {
  const FormAnswer({super.key});

  // final reCeived = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    //if (reCeived[0] != null) {
    //  Get.find<IssuesController>().setGrupo(reCeived);
    //}
    return PopScope(
      onPopInvoked: (didPop) async {
        //Get.find<IssuesController>().limparTudo();
      },
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: appBar,
          body: BodyCommon(
              title: "Cadastrar Check List",
              widget: Container(
                margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 40.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: SingleChildScrollView(child:
                    GetBuilder<ListAnswerController>(builder: (lstController) {
                  return Form(
                      key: formKey,
                      child:
                          GetBuilder<IssuesController>(builder: (controller) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Dados do Cliente",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            CustomTextField(
                              controller: lstController.nameCliente,
                              label: "Nome do Cliente",
                              validator: (ng) {
                                if (ng!.isEmpty) {
                                  return 'O nome é obrigatório';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            CustomTextField(
                              controller: lstController.nProjeto,
                              label: "Número do Pedido",
                              validator: (dg) {
                                if (dg!.isEmpty) {
                                  return 'O número é obrigatório';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Selecionar Grupos",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            DropdownButton<Grupo>(
                                value: controller.dropdownValue,
                                items: controller.allGrupos
                                    .map<DropdownMenuItem<Grupo>>(
                                        (Grupo value) {
                                  return DropdownMenuItem<Grupo>(
                                    value: value,
                                    child: Text(value.title!),
                                  );
                                }).toList(),
                                onChanged: (Grupo? g) {
                                  controller.setDropdownValue(g);
                                }),
                            ElevatedButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    lstController
                                        .finishAnswer(controller.dropdownValue);
                                  }
                                },
                                child: const Text("Finalizar")),
                          ],
                        );
                      }));
                })),
              ))),
    );
  }
}
