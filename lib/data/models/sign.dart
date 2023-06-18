import 'package:json_annotation/json_annotation.dart';

import '../../utils/logic/helpers/json-serializable/date_time_converter.dart';
import 'user.dart';

part 'sign.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
@DateTimeConverter()
class Sign {
  Sign({
    required this.token,
    required this.user,
  });

  String token;

  User user;

  factory Sign.fromJson(Map<String, dynamic> json) => _$SignFromJson(json);

  Map<String, dynamic> toJson() => _$SignToJson(this);
}
