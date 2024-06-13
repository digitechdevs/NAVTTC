import 'package:flutter/material.dart';
import 'package:navttc/src/components/bottom_rounded_header.dart';
import 'package:navttc/src/components/primary_button.dart';
import 'package:navttc/src/core/utils/app_exports.dart';
import 'package:navttc/src/modules/instructor/presentation/widgets/attendance_detailed_view.dart';

import '../../../../components/custom_text.dart';
import '../../../../core/theme/app_textstyles.dart';

class InstructorAttendanceHistory extends StatelessWidget {
  final List<String> attendanceDates = [
    '2024-06-01',
    '2024-06-02',
    '2024-06-03',
    '2024-06-04',
    '2024-06-05',
  ];

  InstructorAttendanceHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScreenHeaderWithButton(),
            18.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    'Attendance History',
                    alignment: Alignment.center,
                    textStyle: AppTextStyles.middleBlackBoldTextStyle,
                  ),
                  24.ph,
                  ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: attendanceDates.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          attendanceDetailsAlert(context);
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  "Attendance Date: ",
                                  alignment: Alignment.centerLeft,
                                  textStyle:
                                      AppTextStyles.middleBlackBoldTextStyle,
                                ),
                                CustomText(
                                  attendanceDates[index],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (_, i) => Divider(
                      color: AppColors.borderGrey,
                      height: 24.h,
                    ),
                  ),
                  24.ph,
                  PrimaryButton(
                    onTap: () {},
                    text: 'close',
                    textColor: AppColors.primaryWhite,
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
