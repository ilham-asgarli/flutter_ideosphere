// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'close_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloseEvent _$CloseEventFromJson(Map<String, dynamic> json) => CloseEvent(
      distance: (json['distance'] as num).toDouble(),
      event: Event.fromJson(json['event'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CloseEventToJson(CloseEvent instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'event': instance.event.toJson(),
    };
