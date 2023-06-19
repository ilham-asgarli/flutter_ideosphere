import 'package:json_annotation/json_annotation.dart';

import '../../utils/logic/helpers/json-serializable/date_time_converter.dart';
import 'user.dart';

part 'event.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
@DateTimeConverter()
class Event {
  Event({
    required this.id,
    required this.genderId,
    required this.organizer,
    this.name,
    this.description,
    this.address,
    this.maxAge,
    this.minAge,
    this.entryFee,
    required this.participantCount,
    this.participantCapacity,
    this.startTime,
    this.endTime,
    this.tags,
    required this.location,
    required this.joined,
  });

  String id;
  int genderId;
  User organizer;
  String? name;
  String? description;
  String? address;
  int? maxAge;
  int? minAge;
  double? entryFee;
  int? participantCapacity;
  int participantCount;
  DateTime? startTime;
  DateTime? endTime;
  List<String>? tags;
  Location location;
  bool joined;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
@DateTimeConverter()
class Location {
  Location({
    required this.latitude,
    required this.longitude,
  });

  double latitude;
  double longitude;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
