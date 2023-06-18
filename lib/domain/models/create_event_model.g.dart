// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateEventModel _$CreateEventModelFromJson(Map<String, dynamic> json) =>
    CreateEventModel(
      genderId: json['gender_id'] as int,
      name: json['name'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      maxAge: json['max_age'] as int?,
      minAge: json['min_age'] as int?,
      entryFee: (json['entry_fee'] as num?)?.toDouble(),
      participantCapacity: json['participant_capacity'] as int?,
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      endTime: json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateEventModelToJson(CreateEventModel instance) {
  final val = <String, dynamic>{
    'gender_id': instance.genderId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull('address', instance.address);
  writeNotNull('max_age', instance.maxAge);
  writeNotNull('min_age', instance.minAge);
  writeNotNull('entry_fee', instance.entryFee);
  writeNotNull('participant_capacity', instance.participantCapacity);
  writeNotNull('start_time', instance.startTime?.toIso8601String());
  writeNotNull('end_time', instance.endTime?.toIso8601String());
  writeNotNull('tags', instance.tags);
  val['location'] = instance.location.toJson();
  return val;
}

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
