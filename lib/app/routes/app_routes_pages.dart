import 'package:get/get.dart';
import 'package:mylist/app/pages/category/category_page.dart';
import 'package:mylist/app/pages/user/user_page.dart';

import '../pages/base_page.dart';
import '../pages/home/home_page.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.base,
      page: () => const BasePage(),
    ),
    GetPage(
      name: AppRoutes.category,
      page: () => const CategoryPage(),
    ),
    GetPage(
      name: AppRoutes.user,
      page: () => const UserPage(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
    ),
  ];
}

abstract class AppRoutes {
  static const String base = '/';
  static const String user = '/user';
  static const String category = '/category';
  static const String home = '/home';
}
