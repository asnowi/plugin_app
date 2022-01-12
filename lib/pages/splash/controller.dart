import 'package:get/get.dart';
import 'package:plugin_app/common/app/app.dart';
import 'package:plugin_app/common/router/router.dart';
import 'package:plugin_app/common/utils/utils.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    LogUtils.GGQ('启动页---> onInit');
    super.onInit();
  }


  @override
  void onReady() {
    LogUtils.GGQ('启动页---> onReady');
    if(Global.hasFirst){
      Get.offAndToNamed(AppRoutes.HOME);
    }else{
      Get.offAndToNamed(AppRoutes.WELCOME);
    }
    super.onReady();
  }

  @override
  void onClose() {
    LogUtils.GGQ('启动页---> onClose');
    super.onClose();
  }

  @override
  void dispose() {
    LogUtils.GGQ('启动页---> dispose');
    super.dispose();
  }
}