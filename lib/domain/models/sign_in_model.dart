import 'package:json_annotation/json_annotation.dart';

import '../../utils/logic/helpers/json-serializable/date_time_converter.dart';

part 'sign_in_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@DateTimeConverter()
class SignInModel {
  SignInModel({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignInModelToJson(this);
}
