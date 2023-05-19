import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserModel {
  UserModel(
    this.id,
    this.email,
    this.password,
    this.userTypeId,
    this.createdAt,
    this.updatedAt, {
    this.phoneNumber,
  });

  String id;
  String email;
  String password;
  int userTypeId;
  String? phoneNumber;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
