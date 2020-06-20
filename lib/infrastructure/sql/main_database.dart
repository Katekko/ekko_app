import 'package:get_storage/get_storage.dart';

abstract class MainDatabase<T> {
  final String _tableName = (T).toString();
  String id;

  List<T> select() {
    var g = GetStorage();
    var table = g.read((_tableName)) as List<dynamic> ?? [];
    return table.map((e) => fromMap(e)).toList();
  }

  void insert(MainDatabase<T> obj) {
    var g = GetStorage();
    var list = g.read(_tableName) as List<dynamic>;
    if (list == null) {
      g.write(_tableName, []);
    }
    list = g.read(_tableName);

    if (list.any((e) => e['id'] == obj.id)) {
      var index = list.indexWhere((e) => e['id'] == obj.id);
      list[index] = obj.toMap();
    } else {
      list.add(obj.toMap());
    }

    g.write(_tableName, list);
  }

  void delete(MainDatabase<T> obj) {
    var g = GetStorage();
    var list = g.read(_tableName) as List<dynamic>;
    if (list.isNotEmpty) {
      list.removeWhere((e) => e['id'] == obj.id);
      g.write(_tableName, list);
    }
  }

  Map<String, dynamic> toMap();
  T fromMap(Map<String, dynamic> map);
}
