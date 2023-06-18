import 'package:flutter/material.dart';

import '../../../../core/constants/app/app_localizations.dart';
import '../../../../core/extensions/num_extension.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../data/models/event.dart';

class EventNotes extends StatelessWidget {
  final Event eventModel;

  const EventNotes({
    Key? key,
    required this.eventModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (eventModel.participantCapacity != null)
          Row(
            children: [
              const Icon(
                Icons.info_outline_rounded,
                size: 15,
              ),
              5.horizontalSpace,
              Expanded(
                child: Text(
                  "Katılımcı sayısı (geçerli/limit): ${eventModel.participantCount}/${eventModel.participantCapacity}",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        if (eventModel.minAge != null || eventModel.maxAge != null) ...[
          5.verticalSpace,
          Row(
            children: [
              const Icon(
                Icons.info_outline_rounded,
                size: 15,
              ),
              5.horizontalSpace,
              Expanded(
                child: Text(
                  "Yaş (min./maks.): ${eventModel.minAge}/${eventModel.maxAge}",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
        5.verticalSpace,
        Row(
          children: [
            const Icon(
              Icons.info_outline_rounded,
              size: 15,
            ),
            5.horizontalSpace,
            Expanded(
              child: Text(
                AppLocalizations.of(context)!
                    .eventGender(eventModel.genderId - 1),
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        5.verticalSpace,
        if (eventModel.address.isNotNull)
          Row(
            children: [
              const Icon(
                Icons.location_on_rounded,
                size: 15,
              ),
              5.horizontalSpace,
              Expanded(
                child: Text(
                  eventModel.address!,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
