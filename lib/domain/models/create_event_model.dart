import 'package:json_annotation/json_annotation.dart';

part 'create_event_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  includeIfNull: false,
)
class CreateEventModel {
  CreateEventModel({
    required this.genderId,
    this.name,
    this.description,
    this.address,
    this.maxAge,
    this.minAge,
    this.entryFee,
    this.participantCapacity,
    this.startTime,
    this.endTime,
    this.tags,
    required this.location,
  });

  int genderId;
  String? name;
  String? description;
  String? address;
  int? maxAge;
  int? minAge;
  double? entryFee;
  int? participantCapacity;
  DateTime? startTime;
  DateTime? endTime;
  List<String>? tags;

  Location location;

  factory CreateEventModel.fromJson(Map<String, dynamic> json) =>
      _$CreateEventModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateEventModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
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
