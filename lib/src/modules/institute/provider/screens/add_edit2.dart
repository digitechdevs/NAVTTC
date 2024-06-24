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

class InstituteAddEdit2 extends HookConsumerWidget {
  const InstituteAddEdit2({super.key});

  @override
  Widget build(context, ref) {
    
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
                key: formKey,
                child: Column(
                  children: [
                    CustomText(
                      "Add/ Edit Details",
                      alignment: Alignment.center,
                      textStyle: AppTextStyles.middleBlackBoldTextStyle,
                    ),
                    12.ph,
                    CustomTextField(
                      label: "Principal",
                      prefixIcon: Icon(Icons.person),

                      
                      fillColor: AppColors.primaryBlack,
                      // controller: email,
                      textCapitalization: TextCapitalization.none,
                      validator: Validator.validateValue,
                      
                      
                    ),
                    8.ph,
                    CustomTextField(
                      label: "Focal Person",
                                              prefixIcon: Icon(Icons.person),

                      fillColor: AppColors.primaryBlack,
                       //controller: name,
                      textCapitalization: TextCapitalization.words,
                      validator: Validator.validateValue,
                    ),
                    8.ph,
                    CustomTextField(
                      label: "Instructor",
                           prefixIcon: Icon(Icons.person),

                      keyboardType: TextInputType.phone,
                      maxLength: 15, 
                      fillColor: AppColors.primaryBlack,
                     // controller: cnic,
                      textCapitalization: TextCapitalization.none,
                      validator: Validator.validateCNIC,
                      inputformater: [
                        FilteringTextInputFormatter.digitsOnly,
                        CNICInputFormatter(),
                      ],
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
