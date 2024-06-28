import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:navttc/src/components/bottom_rounded_header.dart';
import 'package:navttc/src/components/clip_box.dart';
import 'package:navttc/src/components/custom_text.dart';
import 'package:navttc/src/components/custom_textfield.dart';
import 'package:navttc/src/components/cutom_button.dart';
import 'package:navttc/src/components/image_box.dart';
import 'package:navttc/src/components/primary_button.dart';
import 'package:navttc/src/components/selectable_tile.dart';
import 'package:navttc/src/core/theme/app_textstyles.dart';
import 'package:navttc/src/core/utils/app_exports.dart';
import 'package:navttc/src/core/utils/validator.dart';
import 'package:navttc/src/modules/institute/provider/screens/add_edit_principle.dart';
import 'package:navttc/src/modules/instructor/presentation/providers/instructor_provider.dart';
import 'package:navttc/src/services/app_services/field_services.dart';

import '../../../../components/prompts.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../student/presentation/screens/student_home.dart';
import 'add_edit.dart';
import 'add_edit_focalperson.dart';
import 'institue_home.dart';

class InstituteAddEdit2 extends HookConsumerWidget {
  const InstituteAddEdit2({super.key});

  @override
  Widget build(context, ref) {
    
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    var source = ref.watch(instructorProvider);
    return Scaffold(
      body: SingleChildScrollView(
      //  keyboardDismissBehavior:ScrollViewKeyboardDismissBehavior.onDrag, 
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
                    CustomButton(
                            title: 'Principal',
                            showIcon: true,
                            onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InstituteAddEditPrinciple()),
                        );
                      },
   
                    ),
                     12.ph,
                    CustomButton(
                            title: 'Focal Person',
                            showIcon: true,
                             onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InstituteAddEditPerson()),
                        );
                      },
                    ), 12.ph,
                    CustomButton(
                            title: 'Instructor',
                            showIcon: true,
                             onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InstituteAddEditInstructor()),
                        );
                      },
   
   
                    ),

                    8.ph,
                    PrimaryButton(
                      onTap: () {
                        AppRouter.push(const InstituteHome());

                        if (formKey.currentState!.validate());
                        else {
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
