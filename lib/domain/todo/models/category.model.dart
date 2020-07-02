import 'package:arctekko/common/constants/table.constants.dart';
import 'package:arctekko/infrastructure/dal/dao/category.dao.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class CategoryModel {
  String id;
  String name;
  String desc;

  CategoryModel({
    @required this.id,
    @required this.name,
    @required this.desc,
  });

  CategoryModel copy() {
    return CategoryModel(id: this.id, name: this.name, desc: this.desc);
  }

  Future<void> save() async {
    var table = await Hive.openBox(TableConstants.TODO);
    var dao = CategoryDao()
      ..id = this.id
      ..name = this.name
      ..desc = this.desc;

    await table.put(dao.id, dao);
    await table.close();
  }

  Future<void> delete() async {
    var table = await Hive.openBox(TableConstants.TODO);
    await table.delete(this.id);
    await table.close();
  }

  factory CategoryModel.fromDao(CategoryDao dao) {
    return CategoryModel(
      id: dao.id,
      desc: dao.desc,
      name: dao.name,
    );
  }
}
