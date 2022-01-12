import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:plugin_app/common/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'common/app/app.dart';
import 'common/res/res.dart';
import 'common/router/router.dart';

Future<void> main() async {
  await initServices();
  runApp(MyApp());
}

Future<void> initServices() async {
  await Get.putAsync(() => GlobalService().init());
  await Global.init();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812 - 44 - 34),
      builder: () => RefreshConfiguration(
          headerBuilder: () => const WaterDropHeader(),
          footerBuilder:  () => const ClassicFooter(),
          headerTriggerDistance: 80.0,
          springDescription: const SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
          maxOverScrollExtent :100,
          maxUnderScrollExtent:100,
          enableScrollWhenRefreshCompleted: true,
          enableLoadingWhenFailed : true,
          hideFooterWhenNotFull: false,
          enableBallisticLoad: true,
          child: GetMaterialApp(
            // app name
            title: AppStrings.APP_NAME,
            // debug banner
            debugShowCheckedModeBanner: false,
            // 日志
            enableLog: true,
            logWriterCallback: LogUtils.write,
            // 路由
            getPages: AppPages.routes,
            // 启动页面
            initialRoute: AppPages.INITIAL,
          )
      ),
    );
  }
}

