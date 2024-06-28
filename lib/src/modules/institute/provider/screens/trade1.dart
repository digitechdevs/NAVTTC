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
import 'package:navttc/src/components/selectable_tile.dart';
import 'package:navttc/src/core/theme/app_textstyles.dart';
import 'package:navttc/src/core/utils/app_exports.dart';
import 'package:navttc/src/core/utils/validator.dart';
import 'package:navttc/src/modules/institute/provider/screens/trade2.dart';
import 'package:navttc/src/modules/instructor/presentation/providers/instructor_provider.dart';
import 'package:navttc/src/services/app_services/field_services.dart';

import '../../../../components/custom_toggle_switch.dart';
import '../../../../components/prompts.dart';
import 'allied_other_facilities2.dart';

class Institutetrade1 extends HookConsumerWidget {
  const Institutetrade1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    var source = ref.watch(instructorProvider);

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
                child: Column(
                  children: [
                    CustomText(
                      "Trades 1/4",
                      alignment: Alignment.center,
                      textStyle: AppTextStyles.middleBlackBoldTextStyle,
                    ),
                    
                     8.ph,
                      CustomTextField(
                        label: "Graphic Designing (UI/UX Designer)",
                        fillColor: AppColors.primaryWhite,
                        prefixIcon: Icon(Icons.abc),
                        // controller: email,
                        textCapitalization: TextCapitalization.sentences,
                        enabled: false,
                      ),
                    
                    8.ph,
                      CustomTextField(
                        label: "3 Months",
                        fillColor: AppColors.primaryWhite,
                        // controller: email,
                        textCapitalization: TextCapitalization.sentences,
                        enabled: false,
                         prefixIcon: Icon(
                CupertinoIcons.clock,
                      ),
                      ),
                    
                    8.ph,
                      CustomTextField(
                        label: "20",
                        fillColor: AppColors.primaryWhite,
                        // controller: email,
                        textCapitalization: TextCapitalization.sentences,
                        enabled: false,
                      //  prefixIcon: Icon(Icons.group),
                         prefixIcon: Icon(
                CupertinoIcons.group,
                      ),


                      ),
                    8.ph,
                      CustomTextField(
                        label: "Number of Trainees Dropped Out",
                        fillColor: AppColors.primaryWhite,
                        // controller: email,
                        textCapitalization: TextCapitalization.sentences,
                        validator: Validator.validateValue,
                        prefixIcon: Icon(
                CupertinoIcons.person_2,
                      ),
                      ),
                       8.ph,
                      CustomTextField(
                        label: "Number of Trainees Present",
                        fillColor: AppColors.primaryWhite,
                        // controller: email,
                        textCapitalization: TextCapitalization.sentences,
                        validator: Validator.validateValue,
                        prefixIcon: Icon(
                CupertinoIcons.person,
                      ),
                      ),
                  
                  8.ph,
                      CustomTextField(
                        label: "Number of Trainees Absent",
                        fillColor: AppColors.primaryWhite,
                        // controller: email,
                        textCapitalization: TextCapitalization.sentences,
                        validator: Validator.validateValue,
                        prefixIcon: Icon(
                CupertinoIcons.person,
                      ),
                      ),
                     
                    8.ph,
                   PrimaryButton(
                      onTap: () {
                        AppRouter.push(const Institutetrade2());

                        if (!formKey.currentState!.validate());

                        else {
                          Prompts.popMessenger("Please input correct information");
                        }
                      },
                      text: 'Next',
                    ),
                    SizedBox(height: kBottomNavigationBarHeight), // Replace kBottomNavigationBarHeight.ph with equivalent spacing
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
