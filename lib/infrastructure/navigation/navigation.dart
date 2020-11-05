import 'package:get/get.dart';

import '../../presentation/screens.dart';
import 'bindings/controllers/controllers.dart';
import 'routes.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: LoginControllerBinding(),
    ),
  ];
}
