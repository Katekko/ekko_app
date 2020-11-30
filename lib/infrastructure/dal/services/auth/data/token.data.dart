import 'package:json_annotation/json_annotation.dart';

part 'token.data.g.dart';

@JsonSerializable()
class TokenData {
  String token;
  DateTime expiration;

  TokenData({this.token, this.expiration});

  factory TokenData.fromJson(json) => _$TokenDataFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDataToJson(this);
}
