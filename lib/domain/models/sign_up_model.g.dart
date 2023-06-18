// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) => SignUpModel(
      email: json['email'] as String,
      password: json['password'] as String,
      phoneNumber: json['phone_number'] as String?,
      customerModel: json['customer'] == null
          ? null
          : CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
      companyModel: json['company'] == null
          ? null
          : CompanyModel.fromJson(json['company'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) {
  final val = <String, dynamic>{
    'email': instance.email,
    'password': instance.password,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phone_number', instance.phoneNumber);
  writeNotNull('customer', instance.customerModel?.toJson());
  writeNotNull('company', instance.companyModel?.toJson());
  return val;
}

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      genderId: json['gender_id'] as int,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      biography: json['biography'] as String?,
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) {
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

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) => CompanyModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CompanyModelToJson(CompanyModel instance) {
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
