import 'package:arctekko/infrastructure/navigation/routes.dart';
import 'package:arctekko/presentation/add_todo/add_todo.screen.dart';
import 'package:arctekko/presentation/edt_todo/edt_todo.screen.dart';
import 'package:arctekko/presentation/home/home.screen.dart';
import 'package:get/get.dart';

import 'bindings/stores/add_todo.store.binding.dart';
import 'bindings/stores/edt_todo.store.binding.dart';
import 'bindings/stores/home.store.binding.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeStoreBinding(),
    ),
    GetPage(
      name: Routes.ADD_TODO,
      page: () => AddTodoScreen(),
      binding: AddTodoStoreBinding(),
    ),
    GetPage(
      name: Routes.EDT_TODO,
      page: () => EdtTodoScreen(),
      binding: EdtTodoStoreBinding(),
    ),
  ];
}
