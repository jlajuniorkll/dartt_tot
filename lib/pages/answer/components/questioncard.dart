import 'package:flutter/material.dart';
import 'package:dartt_tot/pages/answer/components/option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 40.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: const Column(
        children: [
          Text("Título da pergunta",
              style: TextStyle(
                  color: Color(0xFF101010),
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0)),
          SizedBox(
            height: 20.0 / 2,
          ),
          Option(),
          Option(),
        ],
      ),
    );
  }
}
