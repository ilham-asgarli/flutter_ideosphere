// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => ChatMessage(
      id: json['id'] as String,
      message: json['message'] as String,
      opened: json['opened'] as bool,
      readAll: json['read_all'] as bool,
      userId: json['user_id'] as String,
      owner: json['owner'] as bool,
      createdAt:
          const DateTimeConverter().fromJson(json['created_at'] as String),
    );

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'opened': instance.opened,
      'read_all': instance.readAll,
      'user_id': instance.userId,
      'owner': instance.owner,
      'created_at': const DateTimeConverter().toJson(instance.createdAt),
    };
