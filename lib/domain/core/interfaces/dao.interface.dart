import 'package:hive/hive.dart';
import 'package:darq/darq.dart';

abstract class BaseDao<T> {
  Future<void> save(BaseIdDao<T> value) async {
    var table = await Hive.openBox<BaseIdDao<T>>(T.toString());
    await table.put(value.tableId, value);
  }

  Future<void> saveAll(List<BaseIdDao<T>> value) async {
    var table = await Hive.openBox<BaseIdDao<T>>(T.toString());
    var map = value.toMap((e) => MapEntry(e.tableId, e));
    await table.putAll(map);
  }

  Future<void> delete({String id, Function(BaseIdDao<T> value) where}) async {
    var table = await Hive.openBox<BaseIdDao<T>>(T.toString());
    if (id != null) {
      await table.delete(id);
    } else if (where != null) {
      var items = table.values.where(where);
      items.forEach((i) async => await table.delete(i.toString()));
    }
  }

  Future<BaseIdDao<T>> selectById(String id) async {
    var table = await Hive.openBox<BaseIdDao<T>>(T.toString());
    var key = table.keys.firstWhere((k) => k == id, orElse: () => null);
    var value = table.get(key ?? '');
    return value;
  }

  Future<List<BaseIdDao<T>>> select(
    Function(BaseIdDao<T> value) where, {
    dynamic Function(BaseIdDao<T>) orderBy,
    int page,
  }) async {
    var table = await Hive.openBox<BaseIdDao<T>>(T.toString());
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

  /// Return a list, if don't have any items return a empty list
  Future<List<BaseIdDao<T>>> selectAll() async {
    var table = await Hive.openBox<BaseIdDao<T>>(T.toString());
    var values = table.values.toList();
    return values;
  }

  Future<void> clear() async {
    var table = await Hive.openBox<BaseIdDao<T>>(T.toString());
    await table.clear();
  }
}

mixin BaseIdDao<T> {
  dynamic get tableId;
}
