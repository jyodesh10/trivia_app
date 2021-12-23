import 'package:get/get.dart';

import 'package:trivia_app/app/modules/home/bindings/home_binding.dart';
import 'package:trivia_app/app/modules/home/views/home_view.dart';
import 'package:trivia_app/app/modules/login/bindings/login_binding.dart';
import 'package:trivia_app/app/modules/login/views/login_view.dart';
import 'package:trivia_app/app/modules/register/bindings/register_binding.dart';
import 'package:trivia_app/app/modules/register/views/register_view.dart';
import 'package:trivia_app/app/modules/results/bindings/results_binding.dart';
import 'package:trivia_app/app/modules/results/views/results_view.dart';
import 'package:trivia_app/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:trivia_app/app/modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.RESULTS,
      page: () => ResultsView(),
      binding: ResultsBinding(),
    ),
  ];
}
