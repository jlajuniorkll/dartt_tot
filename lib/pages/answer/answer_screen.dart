import 'package:dartt_tot/pages/answer/components/body.dart';
import 'package:dartt_tot/pages/answer/controllers/listanswer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenAnswer extends StatelessWidget {
  const ScreenAnswer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                Get.find<ListAnswerController>().setIndex();
              },
              child: const Text(
                "Próximo",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: const Body(),
    );
  }
}
