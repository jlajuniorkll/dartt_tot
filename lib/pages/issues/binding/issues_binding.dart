import 'package:dartt_tot/pages/issues/controller/issues_controller.dart';
import 'package:get/get.dart';

class IssuesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(IssuesController());
  }
}
