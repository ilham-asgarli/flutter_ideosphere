import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/extensions/context_extension.dart';
import '../../../../../../utils/ui/constants/colors/app_colors.dart';
import '../../../../../components/custom_button.dart';

class EventView extends StatelessWidget {
  const EventView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
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
          ),
          Expanded(
            child: Padding(
              padding: context.paddingLow,
              child: Column(
                children: [
                  const Spacer(),
                  CustomButton(
                    height: 45,
                    text: "Katıl",
                    onTap: () {},
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
