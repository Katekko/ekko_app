import 'package:flutter/foundation.dart';
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
}
