import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/extensions/context_extension.dart';
import '../../../../../../core/extensions/num_extension.dart';
import '../../../../../../core/router/core/router_service.dart';
import '../../../../../../data/models/event.dart';
import '../../../../../../utils/logic/constants/router/router_constants.dart';
import '../../../../../../utils/ui/constants/colors/app_colors.dart';
import '../../../../../components/custom_button.dart';
import '../../../components/event_notes.dart';
import '../../../components/event_organizer.dart';
import '../../../components/event_times.dart';

class EventCard extends StatelessWidget {
  final Event eventModel;

  const EventCard({super.key, required this.eventModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        RouterService.instance.pushNamed(
          context: context,
          path: RouterConstants.event,
          data: eventModel,
        );
      },
      child: Padding(
        padding: context.paddingLow,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.mainColor2,
          ),
          child: Padding(
            padding: context.paddingNormal,
            child: buildContent(context),
          ),
        ),
      ),
    );
  }

  buildContent(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventModel.name ?? "",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  5.verticalSpace,
                  Text(
                    eventModel.description ?? "",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  10.verticalSpace,
                  EventTimes(eventModel: eventModel),
                  15.verticalSpace,
                  EventOrganizer(eventModel: eventModel),
                ],
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: const DecorationImage(
                        image: CachedNetworkImageProvider(
                          "https://media.istockphoto.com/id/499517325/photo/a-man-speaking-at-a-business-conference.jpg?s=612x612&w=0&k=20&c=gWTTDs_Hl6AEGOunoQ2LsjrcTJkknf9G8BGqsywyEtE=",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  Text(
                    eventModel.entryFee?.toStringAsFixed(2) ?? "Ücretsiz",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  10.verticalSpace,
                  CustomButton(
                    text: "Katıl",
                    padding: context.paddingLow,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
        10.verticalSpace,
        EventNotes(eventModel: eventModel),
      ],
    );
  }
}
