import 'package:flutter/foundation.dart';

class TodoModel {
  int id;
  String title;
  String desc;

  TodoModel({
    this.id,
    @required this.title,
    @required this.desc,
  });
}
