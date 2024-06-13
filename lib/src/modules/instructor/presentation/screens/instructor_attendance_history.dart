import 'package:flutter/material.dart';
import 'package:navttc/src/components/bottom_rounded_header.dart';
import 'package:navttc/src/components/primary_button.dart';
import 'package:navttc/src/core/utils/app_exports.dart';

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
    return 
      Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScreenHeader(),
            10.ph,
       Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              'Attendance History',
                alignment: Alignment.center,
                 textStyle: AppTextStyles.middleBlackBoldTextStyle,
            ),
            10.ph,
            
            ListView.builder(
              shrinkWrap: true,
              itemCount: attendanceDates.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(
                        "Attendance Date:",
                        alignment: Alignment.centerLeft,
                        textStyle: AppTextStyles.middleBlackBoldTextStyle,
                      ),
                      5.pw,
                        CustomText(
                          attendanceDates[index],
                        ),
                      ],
                    ),
                    8.ph,
                    Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                    16.ph
                  ],
                );
              },
            ),
            Center(
              child: PrimaryButton(
                onTap: () {  }, 
                text: 'close',textColor: AppColors.primaryWhite,
            
              ),
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
