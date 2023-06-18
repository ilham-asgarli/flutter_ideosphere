import 'package:json_annotation/json_annotation.dart';

part 'sign_up_model.g.dart';

@JsonSerializable(
    fieldRename: FieldRename.snake, explicitToJson: true, includeIfNull: false)
class SignUpModel {
  SignUpModel({
    required this.email,
    required this.password,
    this.phoneNumber,
    this.customerModel,
    this.companyModel,
  });

  String email;
  String password;
  String? phoneNumber;

  @JsonKey(name: "customer")
  CustomerModel? customerModel;

  @JsonKey(name: "company")
  CompanyModel? companyModel;

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CustomerModel {
  CustomerModel({
    required this.genderId,
    this.firstname,
    this.lastname,
    this.biography,
  });

  int genderId;

  String? firstname;

  String? lastname;

  String? biography;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class CompanyModel {
  CompanyModel({
    this.name,
    this.description,
  });

  String? name;
  String? description;

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);
}
