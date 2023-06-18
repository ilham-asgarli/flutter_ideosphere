import 'package:flutter/material.dart';

import '../../../../../../../../core/extensions/date_time_extension.dart';
import '../../../../../../../../utils/ui/constants/colors/app_colors.dart';

class TimePicker extends StatefulWidget {
  final String text;
  final Function(DateTime? dateTime) onChange;

  const TimePicker({super.key, required this.text, required this.onChange});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: InkWell(
        onTap: () async {
          dateTime = await getDateTime();
          widget.onChange(dateTime);
          setState(() {});
        },
        child: Card(
          margin: EdgeInsets.zero,
          color: AppColors.secondColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              dateTime == null
                  ? widget.text
                  : "${dateTime!.ddMMyyyy}\n${dateTime!.Hm}",
              style: TextStyle(
                color: dateTime == null ? Colors.grey : AppColors.mainColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Future<DateTime?> getDateTime() async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = initialDate;
    DateTime lastDate = firstDate.add(const Duration(days: 365 * 200));

    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (selectedDate == null) return null;

    if (!mounted) return selectedDate;

    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDate),
    );

    return selectedTime == null
        ? selectedDate
        : DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            selectedTime.hour,
            selectedTime.minute,
          );
  }
}
