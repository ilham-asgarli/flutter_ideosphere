// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      email: json['email'] as String,
      password: json['password'] as String?,
      userTypeId: json['user_type_id'] as int,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['created_at'], const DateTimeConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updated_at'], const DateTimeConverter().fromJson),
      deletedAt: _$JsonConverterFromJson<String, DateTime>(
          json['deleted_at'], const DateTimeConverter().fromJson),
      phoneNumber: json['phone_number'] as String?,
    )
      ..customer = json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>)
      ..company = json['company'] == null
          ? null
          : Company.fromJson(json['company'] as Map<String, dynamic>);

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['email'] = instance.email;
  writeNotNull('password', instance.password);
  val['user_type_id'] = instance.userTypeId;
  writeNotNull('phone_number', instance.phoneNumber);
  writeNotNull(
      'created_at',
      _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson));
  writeNotNull(
      'updated_at',
      _$JsonConverterToJson<String, DateTime>(
          instance.updatedAt, const DateTimeConverter().toJson));
  writeNotNull(
      'deleted_at',
      _$JsonConverterToJson<String, DateTime>(
          instance.deletedAt, const DateTimeConverter().toJson));
  writeNotNull('customer', instance.customer?.toJson());
  writeNotNull('company', instance.company?.toJson());
  return val;
}

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      genderId: json['gender_id'] as int,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      biography: json['biography'] as String?,
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) {
  final val = <String, dynamic>{
    'gender_id': instance.genderId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstname', instance.firstname);
  writeNotNull('lastname', instance.lastname);
  writeNotNull('biography', instance.biography);
  return val;
}

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  return val;
}
