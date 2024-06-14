import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navttc/src/components/bottom_rounded_header.dart';
import 'package:navttc/src/components/clip_box.dart';
import 'package:navttc/src/components/custom_text.dart';
import 'package:navttc/src/components/custom_textfield.dart';
import 'package:navttc/src/components/image_box.dart';
import 'package:navttc/src/components/primary_button.dart';
import 'package:navttc/src/core/theme/app_textstyles.dart';
import 'package:navttc/src/core/utils/app_exports.dart';
import 'package:navttc/src/core/utils/app_helpers.dart';
import 'package:navttc/src/core/utils/validator.dart';
import 'package:navttc/src/modules/instructor/presentation/providers/instructor_provider.dart';

class InstructorDetails extends HookConsumerWidget {
  const InstructorDetails({super.key});
  

  @override
  Widget build(context, ref) {


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ScreenHeaderWithButton(),
            18.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.sp),
              child: Consumer(builder: (_, ref, child) { 
                var source = ref.watch(instructorProvider);
                return Column(
                  children: [
                    CustomText(
                      "Add/ Edit Instructor",
                      alignment: Alignment.center,
                      textStyle: AppTextStyles
                          .middleBlackBoldTextStyle,
                    ),
                    12.ph,
                    CustomTextField(
                      label: "Select Trade",
                      fillColor: AppColors.primaryWhite,
                      // controller: email,
                      textCapitalization: TextCapitalization.none,
                      validator: Validator.validateName,
                    ),
                    8.ph,
                    CustomTextField(
                      label: "Name",
                      fillColor: AppColors.primaryWhite,
                      // controller: email,
                      textCapitalization: TextCapitalization.none,
                      validator: Validator.validateName,
                    ),
                    8.ph,
                    CustomTextField(
                      label: "CNIC",
                      fillColor: AppColors.primaryWhite,
                      // controller: email,
                      textCapitalization: TextCapitalization.none,
                      validator: Validator.validateName,
                    ),
                    8.ph,
                    CustomTextField(
                      label: "Email",
                      fillColor: AppColors.primaryWhite,
                      // controller: email,
                      textCapitalization: TextCapitalization.none,
                      validator: Validator.validateName,
                    ),
                    8.ph,
                    CustomTextField(
                      label: "Qualification",
                      fillColor: AppColors.primaryWhite,
                      // controller: email,
                      textCapitalization: TextCapitalization.none,
                      validator: Validator.validateName,
                    ),
                    8.ph,
                    CustomTextField(
                      label: "Experience",
                      fillColor: AppColors.primaryWhite,
                      // controller: email,
                      textCapitalization: TextCapitalization.none,
                      validator: Validator.validateName,
                    ),
                    8.ph,
                    CustomTextField(
                      label: "Phone",
                      fillColor: AppColors.primaryWhite,
                      // controller: email,
                      textCapitalization: TextCapitalization.none,
                      validator: Validator.validateName,
                    ),
                    8.ph,
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: "Resume Upload",
                            fillColor: AppColors.primaryWhite,
                            borderColor: AppColors.transparent,
                            // controller: email,
                            textCapitalization: TextCapitalization.none,
                            validator: Validator.validateName,
                          ),
                        ),
                        6.pw,
                        ClipBox(
                          onTap: () {},
                        ),
                      ],
                    ),
                    8.ph,
                    ImageBox(
                      onTap: ()  {
                        appPrint("***PICK");
                      //  source.pickFile();
                      AppHelpers.pick();
                      }, 
                      image: null,
                     // icon: Icons.,
                    ),
                    8.ph,
                    ImageBox(
                      onTap: () {},
                      icon: CupertinoIcons.person_alt, image: null,
                    ),
                    8.ph,
                    CustomTextField(
                      label: "Remarks",
                      fillColor: AppColors.primaryWhite,
                      // controller: email,
                      textCapitalization: TextCapitalization.none,
                      validator: Validator.validateName,
                    ),
                    8.ph,
                    PrimaryButton(
                      onTap: () {},
                      text: 'SAVE',
                    ),
                    kBottomNavigationBarHeight.ph,
                  ],
                );

               },),
            ),
          ],
        ),
      ),
    );
  }
}
