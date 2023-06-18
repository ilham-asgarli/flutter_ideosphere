import 'package:json_annotation/json_annotation.dart';

import '../../utils/logic/helpers/json-serializable/date_time_converter.dart';

part 'place.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@DateTimeConverter()
class Place {
  String? formattedAddress;
  String? streetNumber;
  String? street;
  String? quarter; // mahalle
  String? district;
  String? city;
  String? country;
  String? countryCode;
  String? languageCode;
  String? zipCode;
  double? lat;
  double? lng;

  Place({
    this.formattedAddress,
    this.streetNumber,
    this.street,
    this.quarter,
    this.district,
    this.city,
    this.country,
    this.countryCode,
    this.languageCode,
    this.zipCode,
    this.lat,
    this.lng,
  });

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}
