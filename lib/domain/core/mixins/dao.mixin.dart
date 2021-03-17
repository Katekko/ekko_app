import 'package:ekko/objectbox.g.dart';

import 'package:get/get.dart' as g;
import 'package:objectbox/internal.dart';

mixin BaseDao<T> {
  int? get tableId;

  static final _store = g.Get.find<Store>();
  static Box<T> _box<T>() {
    return _store.box<T>();
  }

  /// Save the DAO and return the ID of object that was saved
  /// Need help to work better here
  int save(T dao) {
    try {
      var id = _box<T>().put(dao);
      return id;
    } catch (err) {
      rethrow;
    }
  }

  /// Select all the objectss
  static List<T> selectAll<T>() {
    try {
      var all = _box<T>().getAll();
      return all;
    } catch (err) {
      rethrow;
    }
  }

  /// Select by id
  static T? selectById<T>(int id) {
    try {
      var object = _box<T>().get(id);
      return object;
    } catch (err) {
      rethrow;
    }
  }

  /// Select by query
  static List<T> select<T>({
    required Condition condition,
    QueryProperty? orderBy,
    int? orderByFlag,
  }) {
    try {
      Query<T> query;
      List<T> results;
      if (orderBy == null) {
        query = _box<T>().query(condition).build();
        results = query.find();
        query.close();
      } else {
        query = _box<T>()
            .query(condition)
            .order(orderBy, flags: orderByFlag ?? 0)
            .build();
        results = query.find();
      }

      query.close();
      return results;
    } catch (err) {
      rethrow;
    }
  }

  /// Pass ID to delete the ITEM that match the ID
  /// Return true if was sucess otherwise false
  static bool deleteById<T>(int id) {
    try {
      return _box<T>().remove(id);
    } catch (err) {
      rethrow;
    }
  }

  /// Pass the items to delete a range of items
  /// Return true if was sucess otherwise false
  static bool deleteMany<T>(List<BaseDao<T>> items) {
    try {
      var ids = items.map((e) => e.tableId!).toList();
      return _box<T>().removeMany(ids) > 0;
    } catch (err) {
      rethrow;
    }
  }

  /// Delete the object itself
  bool delete() {
    try {
      return _box<T>().remove(this.tableId!);
    } catch (err) {
      rethrow;
    }
  }

  /// Clear this table
  static void clear<T>() => _box<T>().removeAll();
}
