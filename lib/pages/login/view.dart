import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plugin_app/common/config/config.dart';
import 'package:plugin_app/common/router/router.dart';
import 'package:plugin_app/common/widget/widget.dart';

import 'login.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  final String _url = 'https://www.baidu.com';

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: const Icon(Icons.ac_unit),
                  onPressed: _onClick
              ),
              IconButton(
                  icon: const Icon(Icons.label),
                  onPressed: _onLoading
              ),
              IconButton(
                  icon: const Icon(Icons.mode),
                  onPressed: () => _onPermission(context)
              ),
            ],
          )
        ),
      );
  }

   void _onClick() {
     Get.toNamed(AppRoutes.MYWEB, arguments: {
       BundleKey.URL: _url
     });
  }

  void _onLoading() {
    LoadingDialog.show();
  }

  void _onPermission(BuildContext context) {
    PermissionDialog.show(context);
  }

}