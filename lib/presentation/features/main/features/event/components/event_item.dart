import 'package:flutter/material.dart';

import '../../../../../../core/extensions/context_extension.dart';
import '../../../../../../core/extensions/num_extension.dart';
import '../../../../../../core/extensions/string_extension.dart';
import '../../../../../../data/models/event.dart';
import '../../../../../../utils/ui/constants/colors/app_colors.dart';
import '../../../../../components/custom_button.dart';
import '../../../../../widgets/fade_single_child_scroll_view.dart';
import '../../../components/event_notes.dart';
import '../../../components/event_organizer.dart';
import '../../../components/event_times.dart';
import 'event_image_page_view.dart';

class EventItem extends StatelessWidget {
  final Event eventModel;

  const EventItem({
    Key? key,
    required this.eventModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const EventImagePageView(),
        Expanded(
          child: Padding(
            padding: context.paddingLow,
            child: Column(
              children: [
                eventModel.description.isNotNull
                    ? Expanded(
                        child: FadeSingleChildScrollView(
                          fadeSize: 30,
                          color: AppColors.mainColor,
                          child: Text(
                            eventModel.description!,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      )
                    : const Spacer(),
                20.verticalSpace,
                EventTimes(
                  eventModel: eventModel,
                ),
                20.verticalSpace,
                EventOrganizer(
                  eventModel: eventModel,
                ),
                10.verticalSpace,
                EventNotes(
                  eventModel: eventModel,
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        eventModel.entryFee?.toStringAsFixed(2) ?? "Ücretsiz",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomButton(
                        height: 45,
                        text: "Katıl",
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
