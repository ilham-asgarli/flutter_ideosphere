// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['id'] as String,
      genderId: json['gender_id'] as int,
      organizer: User.fromJson(json['organizer'] as Map<String, dynamic>),
      name: json['name'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      maxAge: json['max_age'] as int?,
      minAge: json['min_age'] as int?,
      entryFee: (json['entry_fee'] as num?)?.toDouble(),
      participantCount: json['participant_count'] as int,
      participantCapacity: json['participant_capacity'] as int?,
      startTime: _$JsonConverterFromJson<String, DateTime>(
          json['start_time'], const DateTimeConverter().fromJson),
      endTime: _$JsonConverterFromJson<String, DateTime>(
          json['end_time'], const DateTimeConverter().fromJson),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      joined: json['joined'] as bool,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'gender_id': instance.genderId,
      'organizer': instance.organizer.toJson(),
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'max_age': instance.maxAge,
      'min_age': instance.minAge,
      'entry_fee': instance.entryFee,
      'participant_capacity': instance.participantCapacity,
      'participant_count': instance.participantCount,
      'start_time': _$JsonConverterToJson<String, DateTime>(
          instance.startTime, const DateTimeConverter().toJson),
      'end_time': _$JsonConverterToJson<String, DateTime>(
          instance.endTime, const DateTimeConverter().toJson),
      'tags': instance.tags,
      'location': instance.location.toJson(),
      'joined': instance.joined,
    };

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

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
