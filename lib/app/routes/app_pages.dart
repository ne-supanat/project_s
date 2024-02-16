import 'package:get/get.dart';

import '../modules/main_page/bindings/main_page_binding.dart';
import '../modules/main_page/views/main_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.MAIN_PAGE,
      page: () => const MainPageView(),
      binding: MainPageBinding(),
    ),
  ];
}
