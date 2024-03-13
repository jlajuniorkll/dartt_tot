import 'package:dartt_tot/commons/components/custom_textfield.dart';
import 'package:dartt_tot/pages/issues/controller/issues_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IssueForm extends StatelessWidget {
  const IssueForm({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final MaterialStateProperty<Icon?> thumbIcon =
        MaterialStateProperty.resolveWith<Icon?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const Icon(Icons.check);
        }
        return const Icon(Icons.close);
      },
    );
    return Center(
      child: SingleChildScrollView(
        child: Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: GetBuilder<IssuesController>(
              builder: (controller) {
                return Form(
                  key: controller.formKeyIssue,
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
                          controller: controller.pergunta,
                          label: "Pergunta",
                          validator: (pg) {
                            if (pg!.isEmpty) {
                              return 'O nome é obrigatório';
                            } else {
                              return null;
                            }
                          },
                        ),
                        Row(
                          children: [
                            const Text("Obrigar Pergunta"),
                            Switch(
                                thumbIcon: thumbIcon,
                                value: controller.obPergunta,
                                onChanged: (bool value) {
                                  controller.setObPergunta(value);
                                }),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Obrigar Mídia"),
                            Switch(
                                thumbIcon: thumbIcon,
                                value: controller.obMidia,
                                onChanged: (bool value) {
                                  controller.setObMidia(value);
                                }),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Obrigar Resposta"),
                            Switch(
                                thumbIcon: thumbIcon,
                                value: controller.obResposta,
                                onChanged: (bool value) {
                                  controller.setObResposta(value);
                                }),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (controller.formKeyIssue.currentState!
                                  .validate()) {
                                controller.formKeyIssue.currentState!.save();
                                controller.finalizarIssue(index);
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
