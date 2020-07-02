// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryDaoAdapter extends TypeAdapter<CategoryDao> {
  @override
  final typeId = 1;

  @override
  CategoryDao read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryDao()
      ..id = fields[0] as String
      ..name = fields[1] as String
      ..desc = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, CategoryDao obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.desc);
  }
}
