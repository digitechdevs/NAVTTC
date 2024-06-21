import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import Flutter SVG for SvgPicture
import 'package:navttc/src/components/bottom_rounded_header.dart';
import 'package:navttc/src/components/clip_box.dart';
import 'package:navttc/src/components/custom_text.dart';
import 'package:navttc/src/components/custom_textfield.dart';
import 'package:navttc/src/components/image_box.dart';
import 'package:navttc/src/components/primary_button.dart';
import 'package:navttc/src/core/theme/app_textstyles.dart';
import 'package:navttc/src/core/utils/app_exports.dart';
import 'package:navttc/src/core/utils/validator.dart';
import 'package:navttc/src/modules/instructor/presentation/providers/instructor_provider.dart';
import 'package:navttc/src/services/app_services/field_services.dart';

import '../../../../components/prompts.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../student/presentation/screens/student_home.dart';
import '../institie_provider.dart';

class InstituteDetail extends HookConsumerWidget {
  const InstituteDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    var source = ref.watch(instituteProvider);
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            const ScreenHeaderWithButton(),
            SizedBox(height: 18.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.sp),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomText(
                      "Add/ Edit Instructor",
                      alignment: Alignment.center,
                      textStyle: AppTextStyles.middleBlackBoldTextStyle,
                    ),
                    SizedBox(height: 12.0),
                    CustomTextField(
                      prefixIcon: Transform.scale(
                        scale: 0.6, 
                        child: SvgPicture.asset(
                          AppAssets.building,
                          
                        ),
                      ),
                      label: "Institute of Business Management",
                      fillColor: AppColors.primaryWhite,
                      textCapitalization: TextCapitalization.none,
                      validator: Validator.validateValue,
                    ),
                    SizedBox(height: 8.0),
                    CustomTextField(
                      label: "Korangi Creek Road, Karachi",
                      fillColor: AppColors.primaryWhite,
                      textCapitalization: TextCapitalization.words,
                      validator: Validator.validateValue,
                    ),
                    SizedBox(height: 8.0),
                    CustomTextField(
                      label: "Sindh",
                      maxLength: 15,
                      fillColor: AppColors.primaryWhite,
                      textCapitalization: TextCapitalization.none,
                    ),
                    SizedBox(height: 8.0),
                    CustomTextField(
                      prefixIcon: Icon(Icons.access_time_outlined),
                      label: "Karachi, Korangi",
                      fillColor: AppColors.primaryWhite,
                      textCapitalization: TextCapitalization.none,
                    ),
                    SizedBox(height: 8.0),
                    CustomTextField(
                      prefixIcon: Icon(Icons.email_outlined),
                      label: "Email",
                      fillColor: AppColors.primaryWhite,
                      textCapitalization: TextCapitalization.sentences,
                    ),
                    SizedBox(height: 10.0),
                    CustomText(
                      "Principal's Name",
                      alignment: Alignment.centerLeft,
                      textStyle: AppTextStyles.middleBlackTextStyle,
                    ),
                    SizedBox(height: 8.0),
                    CustomTextField(
                      label: "Dr. Imran Batada",
                      fillColor: AppColors.primaryWhite,
                      textCapitalization: TextCapitalization.none,
                    ),
                    SizedBox(height: 10.0),
                    CustomText(
                      "Focal Person's Contact Number",
                      alignment: Alignment.centerLeft,
                      textStyle: AppTextStyles.middleBlackTextStyle,
                    ),
                    SizedBox(height: 2.0),
                    CustomTextField(
                      label: "Phone",
                      keyboardType: TextInputType.phone,
                      maxLength: 12,
                      fillColor: AppColors.primaryWhite,
                      textCapitalization: TextCapitalization.none,
                    ),
                    SizedBox(height: 30.0),
                    CustomText(
                      "Focal Person's Name",
                      alignment: Alignment.centerLeft,
                      textStyle: AppTextStyles.middleBlackTextStyle,
                    ),
                    SizedBox(height: 10.0),
                    CustomTextField(
                      prefixIcon: Icon(Icons.person_outline),
                      label: "Dr. Imran Batada",
                      fillColor: AppColors.primaryWhite,
                      textCapitalization: TextCapitalization.none,
                    ),
                    SizedBox(height: 10.0),
                    CustomText(
                      "Focal Person's Contact Number",
                      alignment: Alignment.centerLeft,
                      textStyle: AppTextStyles.middleBlackTextStyle,
                    ),
                    SizedBox(height: 8.0),
                    CustomTextField(
                      prefixIcon: Icon(Icons.phone_outlined),
                      label: "phone",
                      fillColor: AppColors.primaryWhite,
                      textCapitalization: TextCapitalization.none,
                    ),
                    SizedBox(height: 8.0),
                    CustomTextField(
                      prefixIcon: Icon(Icons.calendar_month),
                      label: "21-05-2024",
                      fillColor: AppColors.primaryWhite,
                      textCapitalization: TextCapitalization.none,
                    ),
                    SizedBox(height: 8.0),
                    PrimaryButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          // Form is valid, handle saving or other actions
                        } else {
                          // Form is not valid, show an error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please input correct information'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      text: 'SAVE',
                    ),
                    SizedBox(height: kBottomNavigationBarHeight),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
