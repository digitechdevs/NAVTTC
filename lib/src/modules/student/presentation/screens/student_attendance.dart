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

import 'date_tym.dart';

class StudentAttendanceDetails extends HookConsumerWidget {
  const StudentAttendanceDetails({super.key});

 @override
  Widget build(context, ref) {
    final date = useState<DateTime?>(null);
    final time = useState<TimeOfDay?>(null);

    return Scaffold(
      body: SingleChildScrollView(
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
                  8.ph,
                  Row(
                    children: [
                      Expanded(
                        child: ValueBox(
                          value: date.value != null
                              ? '${date.value!.day}/${date.value!.month}/${date.value!.year}'
                              : "Date",
                          icon: CupertinoIcons.calendar_today,
                          onTap: () => handleDateTimePicker(context, date, time, true),
                        ),
                      ),
                      6.pw,
                      Expanded(
                        child: ValueBox(
                          value: time.value != null
                              ? time.value!.format(context)
                              : "Time",
                          icon: CupertinoIcons.time,
                          onTap: () => handleDateTimePicker(context, date, time, false),
                        ),
                      ),
                    ],
                  ),
                  12.ph,
                  PrimaryButton(
                    onTap: () {},
                    text: 'Start Class',
                  ),
                  8.ph,
                  CustomTextField(
                    label: "Take Selfie",
                    fillColor: AppColors.primaryWhite,
                    textCapitalization: TextCapitalization.none,
                    validator: Validator.validateName,
                    suffixIcon: const Icon(CupertinoIcons.camera),
                  ),
                  8.ph,
                  ImageBox(
                    onTap: () {}, image: null,
                  ),
                  8.ph,
                  PrimaryButton(
                    onTap: () {},
                    text: 'End Class',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}