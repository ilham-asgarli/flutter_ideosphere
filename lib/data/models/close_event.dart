import 'package:json_annotation/json_annotation.dart';

import '../../utils/logic/helpers/json-serializable/date_time_converter.dart';
import 'event.dart';

part 'close_event.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
@DateTimeConverter()
class CloseEvent {
  CloseEvent({
    required this.distance,
    required this.event,
  });

  double distance;

  Event event;

  factory CloseEvent.fromJson(Map<String, dynamic> json) =>
      _$CloseEventFromJson(json);

  Map<String, dynamic> toJson() => _$CloseEventToJson(this);
}
