import 'package:arctekko/objectbox.g.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as g;
import 'package:objectbox/internal.dart';

mixin BaseDao<T> {
  int get tableId;

  static final _store = g.Get.find<Store>();
  final _box = _store.box<T>();

  /// Save the DAO and return the ID of object that was saved
  /// Need help to work better here
  int save(T dao) {
    try {
      var id = _box.put(dao);
      return id;
    } catch (err) {
      rethrow;
    }
  }

  /// Select all the objectss
  List<T> selectAll() {
    try {
      var all = _box.getAll();
      return all;
    } catch (err) {
      rethrow;
    }
  }

  /// Select by id
  T selectById() {
    try {
      var object = _box.get(tableId);
      return object;
    } catch (err) {
      rethrow;
    }
  }

  /// Select by query
  List<T> select({
    @required Condition condition,
    QueryProperty orderBy,
    int orderByFlag,
  }) {
    try {
      Query<T> query;
      List<T> results;
      if (orderBy == null) {
        query = _box.query(condition).build();
        results = query.find();
        query.close();
      } else if (orderBy != null) {
        query = _box
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
  ///
  /// Pass the items to delete a range of items
  ///
  /// Pass nothing to use the object's id itself
  ///
  /// Return true if was sucess otherwise false
  bool delete({int id, List<BaseDao<T>> items}) {
    try {
      bool success = false;

      if (id != null) {
        success = _box.remove(id);
      } else if (items != null) {
        var ids = items.map((e) => e.tableId);
        success = _box.removeMany(ids) > 0;
      } else {
        success = _box.remove(this.tableId);
      }

      return success;
    } catch (err) {
      rethrow;
    }
  }

  /// Clear this table
  void clear() => _box.removeAll();
}
