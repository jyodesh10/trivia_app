import 'package:get/get.dart';

import 'package:trivia_app/app/modules/category_page/bindings/category_page_binding.dart';
import 'package:trivia_app/app/modules/category_page/views/category_page_view.dart';
import 'package:trivia_app/app/modules/errors/bindings/errors_binding.dart';
import 'package:trivia_app/app/modules/errors/views/errors_view.dart';
import 'package:trivia_app/app/modules/home/bindings/home_binding.dart';
import 'package:trivia_app/app/modules/home/views/home_view.dart';
import 'package:trivia_app/app/modules/login/bindings/login_binding.dart';
import 'package:trivia_app/app/modules/login/views/login_view.dart';
import 'package:trivia_app/app/modules/options/bindings/options_binding.dart';
import 'package:trivia_app/app/modules/options/views/options_view.dart';
import 'package:trivia_app/app/modules/register/bindings/register_binding.dart';
import 'package:trivia_app/app/modules/register/views/register_view.dart';
import 'package:trivia_app/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:trivia_app/app/modules/splash_screen/views/splash_screen_view.dart';
import 'package:trivia_app/app/modules/trivia_finished/bindings/trivia_finished_binding.dart';
import 'package:trivia_app/app/modules/trivia_finished/views/trivia_finished_view.dart';

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
    // GetPage(
    //   name: _Paths.CATEGORY_PAGE,
    //   page: () => CategoryPageView(),
    //   binding: CategoryPageBinding(),
    // ),
    GetPage(
      name: _Paths.OPTIONS,
      page: () => OptionsView(),
      binding: OptionsBinding(),
    ),
    GetPage(
      name: _Paths.ERRORS,
      page: () => ErrorsView(),
      binding: ErrorsBinding(),
    ),
    GetPage(
      name: _Paths.TRIVIA_FINISHED,
      page: () => TriviaFinishedView(),
      binding: TriviaFinishedBinding(),
    ),
  ];
}
