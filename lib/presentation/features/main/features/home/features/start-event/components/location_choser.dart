import 'package:flutter/material.dart';

import '../../../../../../../../core/extensions/context_extension.dart';
import '../../../../../../../../core/router/core/router_service.dart';
import '../../../../../../../../data/models/place.dart';
import '../../../../../../../../utils/logic/constants/router/router_constants.dart';
import '../../../../../../../../utils/ui/constants/colors/app_colors.dart';

class LocationChooser extends StatefulWidget {
  final String text;
  final Function(Place? place) onChange;

  const LocationChooser({
    super.key,
    required this.text,
    required this.onChange,
  });

  @override
  State<LocationChooser> createState() => _LocationChooserState();
}

class _LocationChooserState extends State<LocationChooser> {
  Place? place;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        place = await RouterService.instance.pushNamed<Place>(
          context: context,
          path: RouterConstants.pickLocation,
        );

        widget.onChange(place);

        setState(() {});
      },
      child: Card(
        margin: EdgeInsets.zero,
        color: AppColors.secondColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 50),
          child: Padding(
            padding: context.paddingLow,
            child: Center(
              child: Text(
                place == null ? widget.text : place?.formattedAddress ?? "",
                style: TextStyle(
                  color: place == null ? Colors.grey : AppColors.mainColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
