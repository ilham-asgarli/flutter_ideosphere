import 'package:flutter/material.dart';

import '../../../../core/extensions/num_extension.dart';

class EventNotes extends StatelessWidget {
  const EventNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.info_outline_rounded,
              size: 15,
            ),
            5.horizontalSpace,
            Expanded(
              child: Text(
                "Katılımcı sayısı (geçerli/limit): 100/150",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
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
                "Yaş (min./maks.): 10/50",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
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
                "Hem erkek, hem kadın katılımcılar için uygundur.",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        5.verticalSpace,
        Row(
          children: [
            const Icon(
              Icons.location_on_rounded,
              size: 15,
            ),
            5.horizontalSpace,
            Expanded(
              child: Text(
                "Ecla Sk. No2A, Merkez mah. İstanbul/Türkiye",
                style: TextStyle(
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
