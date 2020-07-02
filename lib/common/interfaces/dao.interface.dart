import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

abstract class BaseDao<T> {
  Future<void> save({@required String id, @required T value}) async {
    var table = await Hive.openBox<T>(T.toString());
    await table.put(id, value);
    await table.close();
  }

  Future<void> delete(String id) async {
    var table = await Hive.openBox<T>(T.toString());
    await table.delete(id);
    await table.close();
  }

  Future<T> getById(String id) async {
    var table = await Hive.openBox<T>(T.toString());
    var value = table.get(table.keys.firstWhere((k) => k == id));
    await table.close();
    return value;
  }

  Future<List<T>> getAll() async {
    var table = await Hive.openBox<T>(T.toString());
    var values = table.values.toList();
    await table.close();
    return values;
  }
}
