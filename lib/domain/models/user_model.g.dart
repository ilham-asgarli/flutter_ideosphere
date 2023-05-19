// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['id'] as String,
      json['email'] as String,
      json['password'] as String,
      json['user_type_id'] as int,
      DateTime.parse(json['created_at'] as String),
      DateTime.parse(json['updated_at'] as String),
      phoneNumber: json['phone_number'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'user_type_id': instance.userTypeId,
      'phone_number': instance.phoneNumber,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
