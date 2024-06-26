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
import 'package:navttc/src/modules/institute/provider/screens/trade1.dart';
import 'package:navttc/src/modules/instructor/presentation/providers/instructor_provider.dart';
import 'package:navttc/src/services/app_services/field_services.dart';

import '../../../../components/prompts.dart';
import '../../../../components/selectable_tile.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../student/presentation/screens/student_home.dart';

class Institutetrade extends HookConsumerWidget {
  const Institutetrade({super.key});

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
                      "Add/ Edit Instructor",
                      alignment: Alignment.center,
                      textStyle: AppTextStyles.middleBlackBoldTextStyle,
                    ),
                    
                    8.ph,
                    SelectableTile(
                      title: 'Graphic Designing (UI/UX Designer)',
                      showIcon: true,
                      selected: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Institutetrade1()),
                        );
                      },
                      
                    
                    
                    ),
                    8.ph,
                    SelectableTile(
                      title: 'Advance Web application Development',
                      showIcon: true,
                      isGray: true,
                      
                    
                    
                    ),8.ph,
                    SelectableTile(
                      title: 'Certificate in IT (Web Development)',
                      showIcon: true,
                      isGray: true,
                      
                      
                    
                    ),8.ph,
                    SelectableTile(
                      title: 'Data Mining / Business Intelligence',
                      showIcon: true,
                      isGray: true,
                      
                      
                    
                    ),8.ph,
                    const SelectableTile(
                      title: 'Digital Marketing & Search Engine Optimization (SEO)',
                      showIcon: true,
                      isGray: true,
                      
                      
                    
                    ),8.ph,
                    SelectableTile(
                      title: 'eCommerce',
                      showIcon: true,
                      isGray: true,
                      
                      
                    
                    ),8.ph,
                    SelectableTile(
                      title: 'Graphic Design and Video Editing',
                      showIcon: true,
                     isGray: true,

                      
                      
                    
                    ),8.ph,
                    SelectableTile(
                      title: 'Power BI',
                      showIcon: true,
                      isGray: true,
                      
                    
                    
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
