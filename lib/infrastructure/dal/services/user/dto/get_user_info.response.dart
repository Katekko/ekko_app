import 'package:arctekko/infrastructure/dal/services/data/user.data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_user_info.response.g.dart';

@JsonSerializable()
class GetUserInfoResponse {
  bool success;
  DataResponse data;
  String error;

  GetUserInfoResponse({this.success, this.data, this.error});

  factory GetUserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserInfoResponseToJson(this);
}

@JsonSerializable()
class DataResponse {
  UserData user;

  DataResponse({this.user});

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}
