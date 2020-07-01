import 'package:arctekko/common/constants/table.constants.dart';
import 'package:arctekko/infrastructure/dal/dao/todo.dao.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class TodoModel {
  String id;
  String title;
  String desc;

  TodoModel({
    String id,
    @required this.title,
    @required this.desc,
  }) {
    this.id = id ?? Uuid().v1();
  }

  TodoModel copy() {
    return TodoModel(id: this.id, title: this.title, desc: this.desc);
  }

  Future<void> save() async {
    var table = await Hive.openBox(TableConstants.TODO);
    var dao = TodoDao()
      ..id = this.id
      ..title = this.title
      ..desc = this.desc;

    await table.put(dao.id, dao);
    await table.close();
  }

  Future<void> delete() async {
    var table = await Hive.openBox(TableConstants.TODO);
    await table.delete(this.id);
    await table.close();
  }

  factory TodoModel.fromDao(TodoDao dao) {
    return TodoModel(
      id: dao.id,
      desc: dao.desc,
      title: dao.title,
    );
  }
}
