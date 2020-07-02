import 'package:arctekko/infrastructure/dal/dao/category.dao.dart';
import 'package:arctekko/infrastructure/dal/dao/todo.dao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  var dir = await getApplicationDocumentsDirectory();
  Hive
    ..init(dir.path)
    ..registerAdapter(TodoDaoAdapter())
    ..registerAdapter(CategoryDaoAdapter());

  var initialRoute = await Routes.initialRoute;
  return runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Arctekko',
      initialRoute: initialRoute,
      getPages: Nav.routes,
    );
  }
}
