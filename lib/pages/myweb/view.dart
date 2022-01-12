import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plugin_app/common/res/res.dart';
import 'package:plugin_app/common/utils/utils.dart';
import 'package:plugin_app/pages/myweb/myweb.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends GetView<MyWebController> {
  MyWebView({Key? key}) : super(key: key);

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: _buildWebView(context),
    ));
  }

  Widget _buildWebView(BuildContext context) {
    return GetBuilder<MyWebController>(
        id: 'url',
        builder: (_) => (controller.urlIsNotEmpty())
            ? WebView(
                initialUrl: controller.url,
                //是否允许js执行
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
                onProgress: (int progress) {
                  LogUtils.GGQ('WebView is loading (progress : $progress%');
                },
                //JS和Flutter通信的Channel
                javascriptChannels: <JavascriptChannel>{
                  _toasterJavascriptChannel(context)
                },
                navigationDelegate: (NavigationRequest request) {
                  if (request.url.startsWith('https://www.baidu.com/')) {
                    LogUtils.GGQ('blocking navigation to $request}');
                    return NavigationDecision.prevent;
                  }
                  LogUtils.GGQ('allowing navigation to $request');
                  return NavigationDecision.navigate;
                },
                onPageStarted: (String url) {
                  LogUtils.GGQ('Page started loading: $url');
                },
                onPageFinished: (String url) {
                  LogUtils.GGQ('Page finished loading: $url');
                },
                gestureNavigationEnabled: true,
                backgroundColor: const Color(0x00000000),
              )
            : const Center(
                child: Text('empty',
                    style: TextStyle(color: AppColors.primaryText)),
              ));
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}
