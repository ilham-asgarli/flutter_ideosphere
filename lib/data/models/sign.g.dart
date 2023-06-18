// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sign _$SignFromJson(Map<String, dynamic> json) => Sign(
      token: json['token'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignToJson(Sign instance) => <String, dynamic>{
      'token': instance.token,
      'user': instance.user.toJson(),
    };
