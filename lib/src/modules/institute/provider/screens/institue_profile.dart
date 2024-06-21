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


class InstituteProfile extends HookConsumerWidget {
  const InstituteProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _switchValue = useState(false);
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
                key: formKey,
                child: Column(
                  children: [
                    CustomText(
                      "Partner Institute's Profile 2/2",
                      alignment: Alignment.center,
                      textStyle: AppTextStyles.middleBlackBoldTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          "NAVTTC Accredited?",
                          alignment: Alignment.centerLeft,
                          // textStyle: AppTextStyles.middleBlackBoldTextStyle,
                        ),
                        CupertinoSwitch(
                          activeColor: AppColors.primaryBlack,
                          value: _switchValue.value,
                          onChanged: (bool value) {
                            _switchValue.value = value;
                            
                          },
                        ),
                      ],
                    ),
                    8.ph,
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: "Institutional Accredited?",
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
                    CustomTextField(
                      label: "Remarks",
                      fillColor: AppColors.primaryWhite,
                      // controller: remarks,
                      textCapitalization: TextCapitalization.sentences,
                      // validator: Validator.validateRemarks,
                    ),
                    8.ph,
                    PrimaryButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          // Handle the form submission
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
