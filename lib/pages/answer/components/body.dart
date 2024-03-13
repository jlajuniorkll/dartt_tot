import 'package:dartt_tot/pages/answer/components/progressbar.dart';
import 'package:dartt_tot/pages/answer/components/questioncard.dart';
import 'package:dartt_tot/pages/answer/controllers/listanswer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: const Color(0xFF252C4A)),
        SafeArea(child: GetBuilder<ListAnswerController>(builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ProgressBar(),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text.rich(TextSpan(
                  text: "Pergunta: ${controller.index}",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: const Color(0xFF8B94BC)),
                  children: [
                    TextSpan(
                      text:
                          "/${controller.answer.question!.grupo![0].subgrupo!.length}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: const Color(0xFF8B94BC)),
                    )
                  ],
                )),
              ),
              const Divider(
                thickness: 1.5,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                  child: PageView.builder(
                      itemBuilder: (context, index) => const QuestionCard()))
            ],
          );
        }))
      ],
    );
  }
}
