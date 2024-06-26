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
import 'package:navttc/src/modules/institute/provider/screens/institute_profile2.dart';
import 'package:navttc/src/modules/instructor/presentation/providers/instructor_provider.dart';
import 'package:navttc/src/services/app_services/field_services.dart';

import '../../../../components/custom_toggle_switch.dart';
import '../../../../components/prompts.dart';

class InstituteProfile extends HookConsumerWidget {
  const InstituteProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _switchValue = useState(false);
    final _switchValue2 = useState(false);

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
                      "Partner Institute's Profile 1/2",
                      alignment: Alignment.center,
                      textStyle: AppTextStyles.middleBlackBoldTextStyle,
                    ),
                    SizedBox(height: 8), // Replace 8.ph with equivalent spacing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          "NAVTTC Accredited?",
                          alignment: Alignment.centerLeft,
                          // textStyle: AppTextStyles.middleBlackBoldTextStyle,
                        ),
                        CustomToggleSwitch(
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
                        6.ph,
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
                    Row(
                      children: [
                       Expanded(
                          child: SelectableTile(
                            title: 'Is Registered',
                            showIcon: false,
                            selected: false,
                            suffix: CustomToggleSwitch(
                  value: _switchValue2.value,
                  onChanged: (bool value) {
                    _switchValue2.value = value;
                  },
                ),

                            
                          ),
                        ),
                      ],
                    ),
                    8.ph,
                    Row(
                      children: [
                        Expanded(
                          child: SelectableTile(
                            title: 'Name of Registration Authority',
                            showIcon: false,
                            selected: false,
                          
                          ),
                        ),
                        6.ph,
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
                    PrimaryButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const InstituteProfile2()),
                          );
                        } else {
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
