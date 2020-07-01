import 'package:arctekko/common/constants/table.constants.dart';
import 'package:hive/hive.dart';

part 'todo.dao.g.dart';

@HiveType(typeId: 0)
class TodoDao extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String desc;

  static Future<TodoDao> getById(String id) async {
    var table = await Hive.openBox(TableConstants.TODO);
    var value = table.get(table.keys.firstWhere((k) => k == id));
    await table.close();
    return value;
  }

  static Future<List<TodoDao>> getAll() async {
    var table = await Hive.openBox<TodoDao>(TableConstants.TODO);
    var values = table.values.toList();
    await table.close();
    return values;
  }
}
