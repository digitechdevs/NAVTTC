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
import 'package:navttc/src/modules/institute/provider/institie_provider.dart';
import 'package:navttc/src/modules/instructor/presentation/providers/instructor_provider.dart';
import 'package:navttc/src/services/app_services/field_services.dart';

import '../../../../components/prompts.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../student/presentation/screens/student_home.dart';

class InstituteAddEditPerson extends HookConsumerWidget {
  const InstituteAddEditPerson({super.key});

  @override
  Widget build(context, ref) {

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();


    var source = ref.watch(instituteProvider);
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
                      "Add/Edit Person",
                      alignment: Alignment.center,
                      textStyle: AppTextStyles.middleBlackBoldTextStyle,
                    ),
                    12.ph,
                    CustomTextField(
                      label: "Institute Id",
                      fillColor: AppColors.primaryWhite,
                      // controller: email,
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.phone,


                    ),12.ph,
                    CustomTextField(
                      label: "Institute Name",
                      fillColor: AppColors.primaryWhite,
                      // controller: email,
                      textCapitalization: TextCapitalization.words,

                    ),12.ph,
                    CustomTextField(
                      label: "Name",
                      fillColor: AppColors.primaryWhite,
                      // controller: email,
                      textCapitalization: TextCapitalization.words,

                    ),12.ph,
                    CustomTextField(
                      label: "Phone Number",
                      fillColor: AppColors.primaryWhite,
                      // controller: email,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.phone,


                    ),

                    8.ph,
                    PrimaryButton(
                      onTap: () {
                        Navigator.pop(context);
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
