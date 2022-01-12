import 'package:get/get.dart';
import 'package:plugin_app/common/config/config.dart';
import 'package:plugin_app/common/utils/utils.dart';

class WelcomeController extends GetxController{

  void setHasFirst () {
    StorageUtil().setBool(SaveInfoKey.HAS_FIRST, true);
  }


  @override
  void onReady() {
    this.setHasFirst();
    super.onReady();
  }
}