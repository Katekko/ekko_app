import 'package:arctekko/infrastructure/sql/main_database.dart';

class TodoDao extends MainDatabase<TodoDao> {
  String id;
  String title;
  String desc;
  TodoDao({this.id, this.title, this.desc});

  void save() {
    insert(this);
  }

  void remove() {
    delete(this);
  }

  @override
  Map<String, dynamic> toMap() {
    return {'id': this.id, 'title': this.title, 'desc': this.desc};
  }

  @override
  TodoDao fromMap(Map<String, dynamic> map) {
    return TodoDao(id: map['id'], title: map['title'], desc: map['desc']);
  }
}
