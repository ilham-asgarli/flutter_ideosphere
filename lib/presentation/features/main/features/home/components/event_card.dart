import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/extensions/context_extension.dart';
import '../../../../../../core/extensions/num_extension.dart';
import '../../../../../../core/router/core/router_service.dart';
import '../../../../../../utils/logic/constants/router/router_constants.dart';
import '../../../../../../utils/ui/constants/colors/app_colors.dart';
import '../../../../../components/custom_button.dart';
import '../../../components/event_notes.dart';
import '../../../components/event_organizer.dart';
import '../../../components/event_times.dart';

class EventCard extends StatefulWidget {
  final int index;

  const EventCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        RouterService.instance.pushNamed(
          path: RouterConstants.event,
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
            child: buildContent(),
          ),
        ),
      ),
    );
  }

  buildContent() {
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
                    "İsim",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  5.verticalSpace,
                  Text(
                    "What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  10.verticalSpace,
                  const EventTimes(),
                  15.verticalSpace,
                  const EventOrganizer(),
                ],
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: Column(
                children: [
                  Hero(
                    tag: "image_${widget.index}",
                    transitionOnUserGestures: true,
                    child: Container(
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
                  ),
                  10.verticalSpace,
                  Text(
                    "Ücretsiz",
                    style: TextStyle(
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
        const EventNotes(),
      ],
    );
  }
}
