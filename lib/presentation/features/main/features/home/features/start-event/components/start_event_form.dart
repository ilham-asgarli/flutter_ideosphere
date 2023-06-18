import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../core/extensions/num_extension.dart';
import '../../../../../../../../core/extensions/string_extension.dart';
import '../../../../../../../../utils/ui/constants/colors/app_colors.dart';
import '../../../../../../../components/custom_button.dart';
import '../../../../../../../components/custom_text_field.dart';
import '../../../../../../../widgets/fractionally_sized_circular_progress_indicator.dart';
import '../state/start_event_cubit.dart';
import 'choose_gender.dart';
import 'location_choser.dart';
import 'time_picker.dart';

class StartEventForm extends StatelessWidget {
  const StartEventForm({super.key});

  @override
  Widget build(BuildContext context) {
    StartEventCubit startEventCubit = BlocProvider.of<StartEventCubit>(context);

    return Form(
      key: startEventCubit.startEventViewModel.formKey,
      child: Column(
        children: [
          CustomTextField(
            fillColor: Colors.white,
            hintText: "Etkinlik ismi",
            hintTextColor: Colors.grey,
            textColor: AppColors.mainColor,
            keyboardType: TextInputType.name,
            onSaved: (newValue) {
              if (newValue.isNotNull && newValue!.isNotEmpty) {
                startEventCubit.startEventViewModel.name = newValue;
              }
            },
          ),
          10.verticalSpace,
          CustomTextField(
            fillColor: Colors.white,
            hintText: "Açıklama",
            hintTextColor: Colors.grey,
            textColor: AppColors.mainColor,
            keyboardType: TextInputType.text,
            maxLines: null,
            maxLength: 3000,
            onSaved: (newValue) {
              if (newValue.isNotNull && newValue!.isNotEmpty) {
                startEventCubit.startEventViewModel.description = newValue;
              }
            },
          ),
          10.verticalSpace,
          ChooseGender(onChange: (gender) {
            startEventCubit.startEventViewModel.genderId = gender;
          }),
          10.verticalSpace,
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  fillColor: Colors.white,
                  hintText: "Minimum yaş",
                  hintTextColor: Colors.grey,
                  textColor: AppColors.mainColor,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  maxLength: 3,
                  counterText: "",
                  onSaved: (newValue) {
                    if (newValue.isNotNull && newValue!.isNotEmpty) {
                      startEventCubit.startEventViewModel.minAge =
                          int.tryParse(newValue ?? "");
                    }
                  },
                ),
              ),
              10.horizontalSpace,
              const Text("-"),
              10.horizontalSpace,
              Expanded(
                child: CustomTextField(
                  fillColor: Colors.white,
                  hintText: "Maksimum yaş",
                  hintTextColor: Colors.grey,
                  textColor: AppColors.mainColor,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  maxLength: 3,
                  counterText: "",
                  onSaved: (newValue) {
                    if (newValue.isNotNull && newValue!.isNotEmpty) {
                      startEventCubit.startEventViewModel.maxAge =
                          int.tryParse(newValue ?? "");
                    }
                  },
                ),
              ),
            ],
          ),
          10.verticalSpace,
          CustomTextField(
            fillColor: Colors.white,
            hintText: "Kapasite",
            hintTextColor: Colors.grey,
            textColor: AppColors.mainColor,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            onSaved: (newValue) {
              if (newValue.isNotNull && newValue!.isNotEmpty) {
                startEventCubit.startEventViewModel.participantCapacity =
                    int.tryParse(newValue ?? "");
              }
            },
          ),
          10.verticalSpace,
          CustomTextField(
            fillColor: Colors.white,
            hintText: "Etiketler (örn. konferans, bilim)",
            hintTextColor: Colors.grey,
            textColor: AppColors.mainColor,
            keyboardType: TextInputType.text,
            maxLines: null,
            maxLength: 100,
            onSaved: (newValue) {
              if (newValue.isNotNull && newValue!.isNotEmpty) {
                startEventCubit.startEventViewModel.tags =
                    newValue.split(",").map((e) => e.trim()).toList();
              }
            },
          ),
          10.verticalSpace,
          CustomTextField(
            fillColor: Colors.white,
            hintText: "Giriş ücreti",
            hintTextColor: Colors.grey,
            textColor: AppColors.mainColor,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            onSaved: (newValue) {
              if (newValue.isNotNull && newValue!.isNotEmpty) {
                startEventCubit.startEventViewModel.entryFee =
                    double.tryParse(newValue ?? "");
              }
            },
          ),
          10.verticalSpace,
          Row(
            children: [
              Expanded(
                child: TimePicker(
                  text: "Başlama zamanı",
                  onChange: (dateTime) {
                    startEventCubit.startEventViewModel.startTime = dateTime;
                  },
                ),
              ),
              10.horizontalSpace,
              const Text("-"),
              10.horizontalSpace,
              Expanded(
                child: TimePicker(
                  text: "Bitiş zamanı",
                  onChange: (dateTime) {
                    startEventCubit.startEventViewModel.endTime = dateTime;
                  },
                ),
              ),
            ],
          ),
          10.verticalSpace,
          LocationChooser(
            text: "Adres",
            onChange: (place) {
              startEventCubit.startEventViewModel.place = place;
            },
          ),
          10.verticalSpace,
          CustomButton(
            height: 50,
            text: "Oluştur",
            onTap: startEventCubit.startEventViewModel.onTapCreate,
            child: context.watch<StartEventCubit>().state.creating
                ? const FractionallySizedCircularProgressIndicator(
                    factor: 0.5,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
