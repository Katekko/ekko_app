import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.data.g.dart';

@JsonSerializable()
class UserData {
  final int id;
  final String name, email;

  UserData({
    @required this.id,
    @required this.name,
    @required this.email,
  });

  factory UserData.fromJson(json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
