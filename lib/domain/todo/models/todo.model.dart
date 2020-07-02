import 'package:arctekko/domain/todo/models/category.model.dart';
import 'package:arctekko/infrastructure/dal/dao/category.dao.dart';
import 'package:arctekko/infrastructure/dal/dao/todo.dao.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class TodoModel {
  String id;
  String title;
  String desc;
  CategoryModel category;

  TodoModel({
    String id,
    @required this.title,
    @required this.desc,
    @required this.category,
  }) {
    this.id = id ?? Uuid().v1();
  }

  TodoModel copy() {
    return TodoModel(
      id: this.id,
      title: this.title,
      desc: this.desc,
      category: this.category,
    );
  }

  Future<void> save() async {
    var categoryDao = CategoryDao()
      ..id = this.category.id
      ..name = this.category.name
      ..desc = this.category.desc;

    var dao = TodoDao()
      ..id = this.id
      ..title = this.title
      ..desc = this.desc
      ..categoryDao = categoryDao;

    await TodoDao().save(id: dao.id, value: dao);
  }

  Future<void> delete() async {
    await TodoDao().delete(this.id);
  }

  factory TodoModel.fromDao(TodoDao dao) {
    return TodoModel(
      id: dao.id,
      desc: dao.desc,
      title: dao.title,
      category: CategoryModel.fromDao(dao.categoryDao),
    );
  }
}
