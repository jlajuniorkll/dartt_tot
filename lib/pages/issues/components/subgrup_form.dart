import 'package:dartt_tot/commons/components/custom_textfield.dart';
import 'package:dartt_tot/pages/issues/controller/issues_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubGrupForm extends StatelessWidget {
  const SubGrupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: GetBuilder<IssuesController>(
              builder: (controller) {
                return Form(
                  key: controller.formKeyGroup,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Stack(children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(Icons.close),
                                )),
                          ),
                          Container(
                              padding: const EdgeInsets.all(8),
                              alignment: Alignment.center,
                              child: const Text(
                                "Cadastrar Pergunta",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w600),
                              ))
                        ]),
                        const SizedBox(
                          height: 32,
                        ),
                        CustomTextField(
                          controller: controller.nmesbGrupo,
                          label: "Nome do SubGrupo",
                          validator: (ng) {
                            if (ng!.isEmpty) {
                              return 'O nome é obrigatório';
                            } else {
                              return null;
                            }
                          },
                        ),
                        CustomTextField(
                          controller: controller.dcesbGrupo,
                          label: "Descrição do SubGrupo",
                          validator: (dg) {
                            if (dg!.isEmpty) {
                              return 'A descrição é obrigatória';
                            } else {
                              return null;
                            }
                          },
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (controller.formKeyGroup.currentState!
                                  .validate()) {
                                controller.formKeyGroup.currentState!.save();
                                controller.finalizarSubGrupo();
                                Get.back();
                              }
                            },
                            child: const Text("Salvar")),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }
}
