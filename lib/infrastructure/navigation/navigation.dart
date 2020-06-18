import 'package:arctekko/infrastructure/navigation/routes.dart';
import 'package:arctekko/presentation/add_todo/add_todo.screen.dart';
import 'package:arctekko/presentation/home/home.screen.dart';
import 'package:get/get.dart';

import 'bindings/stores/add_todo.store.binding.dart';
import 'bindings/stores/home.store.binding.dart';

class Nav {
  static Map<String, GetRoute> routes = {
    Routes.HOME: GetRoute(
      page: HomeScreen(),
      binding: HomeStoreBinding(),
    ),
    Routes.ADD_TODO: GetRoute(
      page: AddTodoScreen(),
      binding: AddTodoStoreBinding(),
    ),
  };
}
