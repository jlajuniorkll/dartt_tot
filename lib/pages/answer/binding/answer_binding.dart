import 'package:dartt_tot/pages/answer/controllers/answer_controller.dart';
import 'package:get/get.dart';

class AnswerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AnswerController());
  }
}
