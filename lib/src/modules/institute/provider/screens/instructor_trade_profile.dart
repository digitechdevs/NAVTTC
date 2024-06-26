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

class InstituteTradeProfile extends HookConsumerWidget {
  const InstituteTradeProfile({super.key});

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
            18.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.sp),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomText(
                      "Instructor Profile",
                      alignment: Alignment.center,
                      textStyle: AppTextStyles.middleBlackBoldTextStyle,
                    ),
                    12.ph,
                    CustomTextField(

                      label: "Name",
                      fillColor: AppColors.primaryWhite,
                      textCapitalization: TextCapitalization.none,
                    ),
                    8.ph,
                    CustomTextField(
                      label: "CNIC",
                      fillColor: AppColors.primaryWhite,
                      textCapitalization: TextCapitalization.words,

                    ),
                    8.ph,
                    CustomTextField(
                      label: "BE",
                      fillColor: AppColors.primaryWhite,
                      textCapitalization: TextCapitalization.none,

                    ),
                    8.ph,
                    CustomTextField(
                      label: "Karachi, Korangi",
                      fillColor: AppColors.primaryWhite,
                      textCapitalization: TextCapitalization.none,
                    ),
                    8.ph,
                    CustomTextField(
                      label: "Phone",
                      fillColor: AppColors.primaryWhite,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.phone,


                    ),

                    8.ph,
                    CustomTextField(
                      label: "Remarks",
                      fillColor: AppColors.primaryWhite,
                      textCapitalization: TextCapitalization.none,
                    ),

                    8.ph,
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
