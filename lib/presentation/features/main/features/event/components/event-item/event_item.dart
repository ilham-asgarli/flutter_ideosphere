import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/extensions/context_extension.dart';
import '../../../../../../../core/extensions/num_extension.dart';
import '../../../../../../../core/extensions/string_extension.dart';
import '../../../../../../../data/models/event.dart';
import '../../../../../../../domain/repositories/event/implementations/event_repository.dart';
import '../../../../../../../utils/logic/constants/enums/app_enum.dart';
import '../../../../../../../utils/ui/constants/colors/app_colors.dart';
import '../../../../../../components/custom_button.dart';
import '../../../../../../widgets/fade_single_child_scroll_view.dart';
import '../../../../../../widgets/fractionally_sized_circular_progress_indicator.dart';
import '../../../../components/event_notes.dart';
import '../../../../components/event_organizer.dart';
import '../../../../components/event_times.dart';
import '../event_image_page_view.dart';
import 'state/event_item_cubit.dart';

class EventItem extends StatelessWidget {
  final Event eventModel;
  final EventType event;

  const EventItem({
    Key? key,
    required this.eventModel,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventItemCubit(),
      child: Column(
        children: [
          Hero(
            tag: "${event.name}-${eventModel.id}-image",
            child: const EventImagePageView(),
          ),
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
                        child: BlocBuilder<EventItemCubit, EventItemState>(
                          builder: (context, state) {
                            return CustomButton(
                              height: 45,
                              text: "Katıl",
                              child: state.joiningEvent
                                  ? const FractionallySizedCircularProgressIndicator(
                                      factor: 0.5,
                                    )
                                  : null,
                              onTap: () async {
                                final EventRepository eventRepository =
                                    EventRepository();

                                context
                                    .read<EventItemCubit>()
                                    .changeJoiningEvent(true);

                                try {
                                  await eventRepository
                                      .joinEvent(eventModel.id);
                                } catch (e) {}

                                if (context.mounted) {
                                  context
                                      .read<EventItemCubit>()
                                      .changeJoiningEvent(false);
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
