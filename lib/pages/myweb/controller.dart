import 'package:get/get.dart';
import 'package:plugin_app/common/app/app.dart';
import 'package:plugin_app/common/config/config.dart';
import 'package:plugin_app/common/utils/utils.dart';
import 'package:plugin_app/pages/myweb/myweb.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebController extends GetxController{

  final state = MyWebState();


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
    state.url = map[BundleKey.URL];
    if(urlIsNotEmpty()) {
      LogUtils.GGQ('----web url---->${state.url}');
      update(['url']);
    }
    super.onReady();
  }

  bool urlIsNotEmpty() {
    return (state.url?.isNotEmpty?? false);
  }
}