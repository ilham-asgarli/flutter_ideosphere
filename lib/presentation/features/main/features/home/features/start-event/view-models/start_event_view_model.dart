import 'package:flutter/cupertino.dart';

import '../../../../../../../../core/router/core/router_service.dart';
import '../../../../../../../../data/models/place.dart';
import '../../../../../../../../domain/models/create_event_model.dart';
import '../../../../../../../../domain/repositories/event/implementations/event_repository.dart';
import '../state/start_event_cubit.dart';

class StartEventViewModel {
  final StartEventCubit startEventCubit;
  final BuildContext context;

  StartEventViewModel(this.startEventCubit, this.context);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late int genderId;
  String? name;
  String? description;
  int? maxAge;
  int? minAge;
  double? entryFee;
  int? participantCapacity;
  DateTime? startTime;
  DateTime? endTime;
  List<String>? tags;

  Place? place;

  final EventRepository eventRepository = EventRepository();

  void onTapCreate() async {
    if (startEventCubit.state.creating) {
      return;
    }

    startEventCubit.changeCreating(true);

    try {
      validateFormAndSave(formKey);

      if (place == null) {
        return;
      }

      CreateEventModel createEventModel = CreateEventModel(
        genderId: genderId,
        name: name,
        address: place?.formattedAddress,
        description: description,
        startTime: startTime?.toUtc(),
        endTime: endTime?.toUtc(),
        entryFee: entryFee,
        minAge: minAge,
        maxAge: maxAge,
        participantCapacity: participantCapacity,
        tags: tags,
        location: Location(
          latitude: place!.lat!,
          longitude: place!.lng!,
        ),
      );

      await eventRepository.createEvent(createEventModel);
      RouterService.instance.pop();
    } catch (e) {}

    startEventCubit.changeCreating(false);
  }

  void validateFormAndSave(GlobalKey<FormState> formKey) {
    if (!formKey.currentState!.validate()) {
      startEventCubit.changeCreating(false);
      throw Error();
    }
    formKey.currentState!.save();
  }
}
