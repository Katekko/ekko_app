import 'package:json_annotation/json_annotation.dart';

part 'token.data.g.dart';

@JsonSerializable()
class TokenData {
  final String token;
  const TokenData({this.token});

  factory TokenData.fromJson(json) => _$TokenDataFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDataToJson(this);
}
