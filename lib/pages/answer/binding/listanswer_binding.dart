import 'package:dartt_tot/pages/answer/controllers/listanswer_controller.dart';
import 'package:get/get.dart';

class CadAnswewrBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ListAnswerController());
  }
}
