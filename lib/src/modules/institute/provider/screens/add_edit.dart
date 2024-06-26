import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

class InstituteAddEditInstructor extends HookConsumerWidget {
  const InstituteAddEditInstructor({super.key});

  @override
  Widget build(context, ref) {
    var email = useTextEditingController();
    var name= useTextEditingController();
    var phone= useTextEditingController();
    var qualify= useTextEditingController();
    var experience= useTextEditingController();
    var remarks = useTextEditingController();
    var cnic = useTextEditingController();    
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();


    var source = ref.watch(instructorProvider);
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior:ScrollViewKeyboardDismissBehavior.onDrag, 
        child: Column(
          children: [
            const ScreenHeaderWithButton(),
            18.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.sp),
              child: Form(
               // key: formKey,
                child: Column(
                  children: [
                    CustomText(
                      "Add/ Edit Instructor",
                      alignment: Alignment.center,
                      textStyle: AppTextStyles.middleBlackBoldTextStyle,
                    ),
                    12.ph,
                    CustomTextField(
                      label: "Select Trade",
                      fillColor: AppColors.primaryWhite,
                      // controller: email,
                      textCapitalization: TextCapitalization.none,
                      validator: Validator.validateValue,
                      
                    ),
                    8.ph,
                    CustomTextField(
                      label: "Name",
                      fillColor: AppColors.primaryWhite,
                       controller: name,
                      textCapitalization: TextCapitalization.words,
                      validator: Validator.validateValue,
                    ),
                    8.ph,
                    CustomTextField(
                      label: "CNIC",
                      keyboardType: TextInputType.phone,
                      maxLength: 15, 
                      fillColor: AppColors.primaryWhite,
                      controller: cnic,
                      textCapitalization: TextCapitalization.none,
                      validator: Validator.validateCNIC,
                      inputformater: [
                        FilteringTextInputFormatter.digitsOnly,
                        CNICInputFormatter(),
                      ],
                    ),
                    8.ph,
                    CustomTextField(
                      label: "Email",
                      fillColor: AppColors.primaryWhite,
                       controller: email ,
                      textCapitalization: TextCapitalization.none,
                      validator: Validator.validateEmail,
                    ),
                    8.ph,
                    CustomTextField(
                      label: "Qualification",
                      fillColor: AppColors.primaryWhite,
                      controller: qualify,
                      textCapitalization: TextCapitalization.sentences,
                      validator: Validator.validateNotEmpty,
                    ),
                    8.ph,
                    CustomTextField(
                      label: "Experience",
                      fillColor: AppColors.primaryWhite,
                       controller: experience,
                      textCapitalization: TextCapitalization.none,
                      validator: Validator.validateNotEmpty,
                    ),
                    8.ph,
                    CustomTextField(
                      label: "Phone",
                      keyboardType: TextInputType.phone,
                      maxLength: 12,
                      fillColor: AppColors.primaryWhite,
                      controller: phone,
                      inputformater: [
                        NoSpaceFormatter(),
                        FilteringTextInputFormatter.digitsOnly,
                        DynamicLengthFormatter(maxLengthFor0: 11, maxLengthFor9: 12),
                        PhoneNumberFormatter(),

                        
                      ],
                      textCapitalization: TextCapitalization.none,
                      validator: Validator.validateMobile,
                    ),
                    8.ph,
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: "Resume Upload",
                            fillColor: AppColors.primaryWhite,
                            borderColor: AppColors.transparent,
                            controller: source.resumePath,
                            enabled: false,
                            textCapitalization: TextCapitalization.none,
                          ),
                        ),
                        6.pw,
                        ClipBox(
                          onTap: () {
                            source.pickResume();
                          },
                        ),
                      ],
                    ),
                    8.ph,
                    ImageBox(
                      onTap: () {
                        source.captureImageOne();
                      },
                      pickedFile: source.loadedImageOne,
                    ),
                    8.ph,
                    ImageBox(
                      onTap: () {
                        source.captureImageTwo();
                      },
                      pickedFile: source.loadedImageTwo,
                      icon: CupertinoIcons.person_alt,
                    ),
                    8.ph,
                    CustomTextField(
                      label: "Remarks",
                      fillColor: AppColors.primaryWhite,
                       controller: remarks,
                      textCapitalization: TextCapitalization.sentences,
                      // validator: Validator.validateRemarks,
                    ),
                    8.ph,
                    PrimaryButton(
                      onTap: () {
                                    if (formKey.currentState!.validate()) {   
                                    } else {
                                      Prompts.popMessenger("Please input correct information");
                                    }
                                  },
                      text: 'SAVE',
                    ),
                    kBottomNavigationBarHeight.ph,
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
