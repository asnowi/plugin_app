import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info/package_info.dart';
import 'package:plugin_app/common/config/config.dart';
import 'package:plugin_app/common/db/db.dart';
import 'package:plugin_app/common/utils/utils.dart';

///全局配置
class Global {
  /// 是否 release
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  /// 是否第一次启动
  static bool hasFirst = false;

  /// 是否 ios
  static bool isIOS = Platform.isIOS;

  /// 是否 android
  static bool isAndroid = Platform.isAndroid;

  /// android 设备信息
  static late AndroidDeviceInfo androidDeviceInfo;

  /// ios 设备信息
  static late IosDeviceInfo iosDeviceInfo;

  /// 包信息
  static late PackageInfo packageInfo;

  /// 持久化数据
  static DBUtil? dbUtil;

  /// 用户信息
  static User? userInfo;

  /// init
  static Future init() async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();

    // 包信息
    Global.packageInfo = await PackageInfo.fromPlatform();
    // 读取设备信息
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Global.isIOS) {
      Global.iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    } else if (Global.isAndroid) {
      Global.androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    }

    //  android 状态栏为透明的沉浸
    if (isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarDividerColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }

    // 工具初始
    await StorageUtil().init();
    // 读取设备第一次打开
    hasFirst = StorageUtil().getBool(SaveInfoKey.HAS_FIRST) ?? false;

    // hive
    await DBUtil.install();
    dbUtil = await DBUtil.getInstance();
    userInfo = dbUtil?.getUser();
  }
}
