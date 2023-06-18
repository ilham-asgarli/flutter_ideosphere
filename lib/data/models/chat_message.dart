import 'package:json_annotation/json_annotation.dart';

import '../../utils/logic/helpers/json-serializable/date_time_converter.dart';

part 'chat_message.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@DateTimeConverter()
class ChatMessage {
  ChatMessage({
    required this.id,
    required this.message,
    required this.opened,
    required this.readAll,
    required this.userId,
    required this.owner,
    required this.createdAt,
  });

  String id;
  String message;
  bool opened; // By me (it is for unread message count)
  bool readAll;
  String userId;
  bool owner;
  DateTime createdAt;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);
}
