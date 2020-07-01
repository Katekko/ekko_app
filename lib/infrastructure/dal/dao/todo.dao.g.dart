// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoDaoAdapter extends TypeAdapter<TodoDao> {
  @override
  final typeId = 0;

  @override
  TodoDao read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoDao()
      ..id = fields[0] as String
      ..title = fields[1] as String
      ..desc = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, TodoDao obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.desc);
  }
}
