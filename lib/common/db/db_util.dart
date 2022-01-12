import 'dart:io';

import 'package:plugin_app/common/app/app.dart';
import 'package:plugin_app/common/db/db.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class DBUtil{
  /// 实例
  static DBUtil? instance;
  /// 用户信息
  Box? userBox;

  /// 初始化，需要在 main.dart 调用
  /// <https://docs.hivedb.dev/>
  static Future<void> install() async {
    /// 初始化数据库地址
    Directory document = await getApplicationDocumentsDirectory();
    Hive.init(document.path);

    /// 注册自定义对象（实体）
    /// <https://docs.hivedb.dev/#/custom-objects/type_adapters>
    /// Hive.registerAdapter(SettingsAdapter());
    Hive.registerAdapter(UserAdapter());
  }

  /// 初始化 Box
  static Future<DBUtil?> getInstance() async {
    if (instance == null) {
      instance = DBUtil();
      // await Hive.initFlutter();
      //
      instance?.userBox = await Hive.openBox('user');
    }
    return instance;
  }

  ////---------------------------------
  User? getUser(){
    final users =  Global.dbUtil?.userBox?.values;
    if(users != null && users.isNotEmpty){
      return users.last;
    }
    return null;
  }
}