import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../core/extensions/context_extension.dart';
import '../../../../../../utils/ui/constants/colors/app_colors.dart';
import '../../../../../widgets/expandable_page_view.dart';

class EventImagePageView extends StatefulWidget {
  const EventImagePageView({Key? key}) : super(key: key);

  @override
  State<EventImagePageView> createState() => _EventImagePageViewState();
}

class _EventImagePageViewState extends State<EventImagePageView> {
  final PageController pageController = PageController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ExpandablePageView.builder(
          controller: pageController,
          itemCount: 5,
          onPageChanged: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          itemBuilder: (context, index) {
            return Hero(
              tag: "image_0",
              transitionOnUserGestures: true,
              child: ShaderMask(
                blendMode: BlendMode.srcATop,
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      AppColors.mainColor,
                    ],
                  ).createShader(bounds);
                },
                child: CachedNetworkImage(
                  imageUrl:
                      "https://media.istockphoto.com/id/499517325/photo/a-man-speaking-at-a-business-conference.jpg?s=612x612&w=0&k=20&c=gWTTDs_Hl6AEGOunoQ2LsjrcTJkknf9G8BGqsywyEtE=",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: context.width * 1.1,
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: 0,
          child: AnimatedSmoothIndicator(
            activeIndex: selectedIndex,
            count: 5,
            effect: const WormEffect(
              dotHeight: 5,
              dotWidth: 5,
              activeDotColor: AppColors.thirdColor,
            ),
          ),
        ),
      ],
    );
  }
}
