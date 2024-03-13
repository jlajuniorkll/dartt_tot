import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: deprecated_member_use
class AnswerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;
  Animation get animation => _animation!;

  @override
  void onInit() {
    super.onInit();
    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController!)
          ..addListener(() {
            update();
          });

    _animationController!.forward();
  }
}
