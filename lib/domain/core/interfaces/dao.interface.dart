import 'package:hive/hive.dart';
import 'package:darq/darq.dart';

mixin BaseDao<T> {
  dynamic get tableId;

  Future<void> save() async {
    var table = await Hive.openBox<BaseDao<T>>(T.toString());
    await table.put(tableId, this);
  }

  Future<void> saveAll(List<BaseDao<T>> value) async {
    var table = await Hive.openBox<BaseDao<T>>(T.toString());
    var map = value.toMap((e) => MapEntry(e.tableId, e));
    await table.putAll(map);
  }

  /// Pass ID to delete the ITEM that match the ID
  ///
  /// Pass the where to delete a range of items
  ///
  /// Pass nothing to use the tableID that class holds
  Future<void> delete({dynamic id, Function(T value) where}) async {
    var table = await Hive.openBox<BaseDao<T>>(T.toString());
    if (tableId != null) {
      await table.delete(tableId);
    } else if (id != null) {
      await table.delete(id);
    } else if (where != null) {
      var items = List<T>.from(table.values);
      items = items.where(where).toList();
      var itemsIterable = List<BaseDao<T>>.from(items);
      for (var item in itemsIterable) {
        await table.delete(item.tableId);
      }
    }
  }

  Future<T> selectById(dynamic id) async {
    var table = await Hive.openBox<BaseDao<T>>(T.toString());
    var key = table.keys.firstWhere((k) => k == id, orElse: () => null);
    var value = table.get(key ?? '');
    return value as T;
  }

  Future<List<T>> select(
    Function(T value) where, {
    dynamic Function(T) orderBy,
    int page,
  }) async {
    var table = await Hive.openBox<BaseDao<T>>(T.toString());
    var items = List<T>.from(table.values);
    items = items.where(where).toList();
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

    return List<T>.from(items);
  }

  /// Return a list, if don't have any items return a empty list
  Future<List<T>> selectAll() async {
    var table = await Hive.openBox<BaseDao<T>>(T.toString());
    var values = table.values.toList();
    return List<T>.from(values);
  }

  Future<void> clear() async {
    var table = await Hive.openBox<BaseDao<T>>(T.toString());
    await table.clear();
  }
}
