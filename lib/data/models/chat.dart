import 'package:json_annotation/json_annotation.dart';

import '../../utils/logic/helpers/json-serializable/date_time_converter.dart';

part 'chat.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@DateTimeConverter()
class Chat {
  Chat({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  String id;
  String name;
  DateTime createdAt;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  Map<String, dynamic> toJson() => _$ChatToJson(this);
}
