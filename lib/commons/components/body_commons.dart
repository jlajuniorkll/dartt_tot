import 'package:flutter/material.dart';

class BodyCommon extends StatelessWidget {
  const BodyCommon({super.key, required this.widget, required this.title});

  final Widget widget;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(color: const Color(0xFF252C4A)),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
          )
        ]),
      ),
      SafeArea(child: widget)
    ]);
  }
}
