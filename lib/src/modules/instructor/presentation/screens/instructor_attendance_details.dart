import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:navttc/src/components/bottom_rounded_header.dart';
import 'package:navttc/src/components/custom_text.dart';
import 'package:navttc/src/components/custom_textfield.dart';
import 'package:navttc/src/components/image_box.dart';
import 'package:navttc/src/components/primary_button.dart';
import 'package:navttc/src/components/value_box.dart';
import 'package:navttc/src/core/theme/app_textstyles.dart';
import 'package:navttc/src/core/utils/app_exports.dart';
import 'package:navttc/src/core/utils/validator.dart';
import 'package:navttc/src/modules/instructor/presentation/providers/instructor_provider.dart';

import '../../../../core/utils/app_helpers.dart';

class AttendanceDetails extends HookConsumerWidget {
  const AttendanceDetails({super.key});

  @override
  Widget build(context, ref) {
    final startDate = useState<DateTime?>(null);
    final startTime = useState<TimeOfDay?>(null);

    final endDate = useState<DateTime?>(null);
    final endTime = useState<TimeOfDay?>(null);

    var source = ref.watch(instructorProvider);

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const ScreenHeaderWithButton(),
                18.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.sp),
                  child: Column(
                    children: [
                      CustomText(
                        "Attendance Details",
                        alignment: Alignment.center,
                        textStyle: AppTextStyles.middleBlackBoldTextStyle,
                      ),
                      12.ph,
                      PrimaryButton(
                        onTap: () {
                          source.startClass();
                        },
                        text: 'Start Class',
                      ),
                      8.ph,
                      Row(
                        children: [
                          Expanded(
                            child: ValueBox(
                              value: startDate.value != null
                                  ? '${startDate.value!.day}/${startDate.value!.month}/${startDate.value!.year}'
                                  : "Date",
                              icon: CupertinoIcons.calendar_today,
                              onTap: () => AppHelpers.handleDateTimePicker(
                                context,
                                startDate,
                                startTime,
                                true,
                              ),
                            ),
                          ),
                          6.pw,
                          Expanded(
                            child: ValueBox(
                              value: startTime.value != null
                                  ? startTime.value!.format(context)
                                  : "Time",
                              icon: CupertinoIcons.time,
                              onTap: () => AppHelpers.handleDateTimePicker(
                                context,
                                startDate,
                                startTime,
                                false,
                              ),
                            ),
                          ),
                        ],
                      ),
                      8.ph,
                      CustomTextField(
                        label: "Class Picture",
                        fillColor: AppColors.primaryWhite,
                        // controller: email,
                        enabled: false,
                        textCapitalization: TextCapitalization.none,
                        validator: Validator.validateValue,
                        suffixIcon: const Icon(CupertinoIcons.camera),
                      ),
                      8.ph,
                      ImageBox(
                        onTap: () {
                          source.captureClassPicture();
                        },
                        pickedFile: source.loadedClassPicture,
                      ),
                      8.ph,
                      CustomTextField(
                        label: "Random Picture / Selfie with class",
                        fillColor: AppColors.primaryWhite,
                        // controller: email,
                        enabled: false,
                        textCapitalization: TextCapitalization.none,
                        validator: Validator.validateValue,
                        suffixIcon: const Icon(CupertinoIcons.camera),
                      ),
                      8.ph,
                      ImageBox(
                        onTap: () {
                          source.captureInstructorSelfie();
                        },
                        pickedFile: source.loadedInstructorSelfie,
                        icon: CupertinoIcons.person_alt,
                      ),
                      8.ph,
                      PrimaryButton(
                        onTap: () {
                          source.endClass();
                        },
                        text: 'End Class',
                      ),
                      8.ph,
                      Row(
                        children: [
                          Expanded(
                            child: ValueBox(
                              value: endDate.value != null
                                  ? '${endDate.value!.day}/${endDate.value!.month}/${endDate.value!.year}'
                                  : "Date",
                              icon: CupertinoIcons.calendar_today,
                              onTap: () => AppHelpers.handleDateTimePicker(
                                  context, endDate, endTime, true),
                            ),
                          ),
                          6.pw,
                          Expanded(
                            child: ValueBox(
                              value: endTime.value != null
                                  ? endTime.value!.format(context)
                                  : "Time",
                              icon: CupertinoIcons.time,
                              onTap: () => AppHelpers.handleDateTimePicker(
                                context,
                                endDate,
                                endTime,
                                false,
                              ),
                            ),
                          ),
                        ],
                      ),
                      8.ph,
                      CustomTextField(
                        label: "Remarks",
                        fillColor: AppColors.primaryWhite,
                        // controller: email,
                        textCapitalization: TextCapitalization.sentences,
                        validator: Validator.validateValue,
                      ),
                      8.ph,
                      PrimaryButton(
                        onTap: () {},
                        text: 'SAVE',
                      ),
                      kBottomNavigationBarHeight.ph,
                    ],
                  ),
                ),
              ],
            ),
          ),
          source.buffers.contains(source.bufferId) ? Container(
            color: AppColors.subtitle,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(color: Colors.white),
          ) : const SizedBox(),
        ],
      ),
    );
  }
}
