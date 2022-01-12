import 'package:get/get.dart';
import 'package:plugin_app/common/app/app.dart';
import 'package:plugin_app/common/config/config.dart';
import 'package:plugin_app/common/utils/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebController extends GetxController{

  String? url;

  @override
  void onInit() {
    if(Global.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.onInit();
  }

  @override
  void onReady() {
    final map = Get.arguments;
    url = map[BundleKey.URL];
    if(urlIsNotEmpty()) {
      LogUtils.GGQ('----web url---->${url}');
      update(['url']);
    }
    super.onReady();
  }

  bool urlIsNotEmpty() {
    return (url?.isNotEmpty?? false);
  }
}