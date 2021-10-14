// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_info.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserInfoResponse _$GetUserInfoResponseFromJson(Map<String, dynamic> json) =>
    GetUserInfoResponse(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : DataResponse.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$GetUserInfoResponseToJson(
        GetUserInfoResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'error': instance.error,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) => DataResponse(
      user: UserData.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
    };
