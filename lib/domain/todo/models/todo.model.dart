import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class TodoModel {
  String id;
  String title;
  String desc;

  TodoModel({
    @required this.title,
    @required this.desc,
  }) {
    this.id = Uuid().v1();
  }
}
