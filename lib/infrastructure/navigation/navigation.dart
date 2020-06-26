import 'package:arctekko/infrastructure/navigation/routes.dart';
import 'package:arctekko/presentation/add_todo/add_todo.screen.dart';
import 'package:arctekko/presentation/edt_todo/edt_todo.screen.dart';
import 'package:arctekko/presentation/home/home.screen.dart';
import 'package:get/get.dart';

import 'bindings/controllers/add_todo.controller.binding.dart';
import 'bindings/controllers/edt_todo.controller.binding.dart';
import 'bindings/controllers/home.controller.binding.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.ADD_TODO,
      page: () => AddTodoScreen(),
      binding: AddTodoControllerBinding(),
    ),
    GetPage(
      name: Routes.EDT_TODO,
      page: () => EdtTodoScreen(),
      binding: EdtTodoControllerBinding(),
    ),
  ];
}
