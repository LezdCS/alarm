import 'package:alarm/src/presentation/views/home_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../src/bindings/home_bindings.dart';
import '../src/presentation/views/settings_view.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBindings(),
    ),
    // GetPage(
    //   name: Routes.SETTINGS,
    //   page: () => SettingsView(),
    //   binding: SettingsBindings(),
    // ),
  ];
}
