import 'package:get/get.dart';
import 'package:plugin_app/pages/myweb/myweb.dart';

class MyWebBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<MyWebController>(() => MyWebController());
  }
}