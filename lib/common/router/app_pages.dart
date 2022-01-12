import 'package:plugin_app/pages/home/home.dart';
import 'package:plugin_app/pages/login/login.dart';
import 'package:plugin_app/pages/myweb/myweb.dart';
import 'package:plugin_app/pages/splash/splash.dart';
import 'package:plugin_app/pages/welcome/welcome.dart';
import 'package:get/get.dart';

import 'router.dart';

class AppPages {

  /// 路由初始页
  static const INITIAL = AppRoutes.SPLASH;

  //页面跳转动画时长
  static const Duration _transitionDuration = Duration(milliseconds: 300);

  static final List<GetPage> routes = [

    /// 启动页
    GetPage(
      name: INITIAL,
      page: () => const SplashView(),
      binding: SplashBinding()
    ),

    /// 登录页
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transitionDuration: _transitionDuration
    ),

    /// 欢迎页
    GetPage(
      name: AppRoutes.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
      transition: Transition.fadeIn,
      // transitionDuration: _transitionDuration,
    ),

    /// 首页
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      // transitionDuration: _transitionDuration,
    ),

    /// my web 页
    GetPage(
      name: AppRoutes.MYWEB,
      page: () => MyWebView(),
      binding: MyWebBinding(),
      transition: Transition.fadeIn,
      // transitionDuration: _transitionDuration,
    ),
  ];

}