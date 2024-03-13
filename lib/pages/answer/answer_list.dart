import 'package:dartt_tot/commons/components/body_commons.dart';
import 'package:dartt_tot/consts.dart';
import 'package:dartt_tot/page_routes/app_routes.dart';
import 'package:dartt_tot/pages/answer/components/lists/listsanswer.dart';
import 'package:dartt_tot/pages/answer/controllers/listanswer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListAnswer extends StatelessWidget {
  const ListAnswer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: appBar,
        drawer: drawerCustom,
        body: BodyCommon(
            widget: GetBuilder<ListAnswerController>(builder: (controller) {
              return controller.listQuestion.isNotEmpty
                  ? ListView.builder(
                      itemCount: controller.listQuestion.length,
                      itemBuilder: (_, index) {
                        return AnswerListTile(
                          answerReceived: controller.listQuestion[index],
                          indexGroup: index,
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        "Nenhum check list encontrado!",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
            }),
            title: "Check Lists"),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.toNamed(PageRoutes.cadAnswer);
          },
          label: const Text(
            "Novo Check",
            style: TextStyle(color: Colors.white),
          ),
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ));
  }
}
