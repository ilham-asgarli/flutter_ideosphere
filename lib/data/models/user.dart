import 'package:json_annotation/json_annotation.dart';

import '../../utils/logic/helpers/json-serializable/date_time_converter.dart';

part 'user.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  includeIfNull: false,
  explicitToJson: true,
)
@DateTimeConverter()
class User {
  User({
    required this.id,
    required this.email,
    required this.password,
    required this.userTypeId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.phoneNumber,
  });

  User.other({
    required this.email,
    required this.userTypeId,
    this.phoneNumber,
    this.customer,
    this.company,
  });

  String? id;
  String email;
  String? password;
  int userTypeId;
  String? phoneNumber;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  Customer? customer;

  Company? company;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
@DateTimeConverter()
class Customer {
  Customer({
    required this.genderId,
    this.firstname,
    this.lastname,
    this.biography,
  });

  int genderId;

  String? firstname;

  String? lastname;

  String? biography;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
@DateTimeConverter()
class Company {
  Company({
    this.name,
    this.description,
  });

  String? name;
  String? description;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
