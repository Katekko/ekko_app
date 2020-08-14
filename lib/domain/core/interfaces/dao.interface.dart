import 'package:hive/hive.dart';
import 'package:darq/darq.dart';

abstract class BaseDao<T> {
  Future<void> save(T value) async {
    var table = await Hive.openBox<T>(T.toString());
    await table.put(value.toString(), value);
  }

  Future<void> saveAll(List<T> value) async {
    var table = await Hive.openBox<T>(T.toString());
    var map = value.toMap((e) => MapEntry(e.toString(), e));
    await table.putAll(map);
  }

  Future<void> delete({String id, Function(T value) where}) async {
    var table = await Hive.openBox<T>(T.toString());
    if (id != null) {
      await table.delete(id);
    } else if (where != null) {
      var items = table.values.where(where);
      items.forEach((i) async => await table.delete(i.toString()));
    }
  }

  Future<T> selectById(String id) async {
    var table = await Hive.openBox<T>(T.toString());
    var key = table.keys.firstWhere((k) => k == id, orElse: () => null);
    var value = table.get(key ?? '');
    return value;
  }

  Future<List<T>> select(
    Function(T value) where, {
    dynamic Function(T) orderBy,
    int page,
  }) async {
    var table = await Hive.openBox<T>(T.toString());
    var items = table.values.where(where).toList();
    if (orderBy != null) {
      items = items.orderBy(orderBy).toList();
    }

    if (page != null) {
      var initList = 10 * page;
      var endList = items.length;
      if (initList + 10 > endList) {
        items = items.sublist(initList);
      } else {
        items = items.sublist(initList, initList + 10);
      }
    }

    return items;
  }

  Future<List<T>> selectAll() async {
    var table = await Hive.openBox<T>(T.toString());
    var values = table.values.toList();
    return values;
  }

  Future<void> clear() async {
    var table = await Hive.openBox<T>(T.toString());
    await table.clear();
  }
}
