// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Place _$PlaceFromJson(Map<String, dynamic> json) => Place(
      formattedAddress: json['formatted_address'] as String?,
      streetNumber: json['street_number'] as String?,
      street: json['street'] as String?,
      quarter: json['quarter'] as String?,
      district: json['district'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      countryCode: json['country_code'] as String?,
      languageCode: json['language_code'] as String?,
      zipCode: json['zip_code'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'formatted_address': instance.formattedAddress,
      'street_number': instance.streetNumber,
      'street': instance.street,
      'quarter': instance.quarter,
      'district': instance.district,
      'city': instance.city,
      'country': instance.country,
      'country_code': instance.countryCode,
      'language_code': instance.languageCode,
      'zip_code': instance.zipCode,
      'lat': instance.lat,
      'lng': instance.lng,
    };
