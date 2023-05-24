import 'package:flutter/material.dart';

import '../../../../../../core/extensions/context_extension.dart';
import '../../../../../../core/extensions/num_extension.dart';
import '../../../../../../utils/ui/constants/colors/app_colors.dart';
import '../../../../../components/custom_button.dart';
import '../../../../../widgets/fade_single_child_scroll_view.dart';
import '../../../components/event_notes.dart';
import '../../../components/event_organizer.dart';
import '../../../components/event_times.dart';
import '../components/event_image_page_view.dart';

class EventView extends StatelessWidget {
  const EventView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const EventImagePageView(),
          Expanded(
            child: Padding(
              padding: context.paddingLow,
              child: Column(
                children: [
                  Expanded(
                    child: FadeSingleChildScrollView(
                      fadeSize: 30,
                      color: AppColors.mainColor,
                      child: Text(
                        "What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  const EventTimes(),
                  20.verticalSpace,
                  const EventOrganizer(),
                  10.verticalSpace,
                  const EventNotes(),
                  10.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Ücretsiz",
                          style: TextStyle(
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
      ),
    );
  }
}
