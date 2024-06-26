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
import 'package:navttc/src/modules/institute/provider/screens/allied_other_facilities3.dart';
import 'package:navttc/src/modules/instructor/presentation/providers/instructor_provider.dart';
import 'package:navttc/src/services/app_services/field_services.dart';

import '../../../../components/custom_toggle_switch.dart';
import '../../../../components/prompts.dart';

class InstituteFacilities2 extends HookConsumerWidget {
  const InstituteFacilities2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _switchValue1 = useState(false);
    final _switchValue2 = useState(false);
    final _switchValue3 = useState(false);
    final _switchValue4 = useState(false);

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
                      "Allied/Other Facilities 2/3",
                      alignment: Alignment.center,
                      textStyle: AppTextStyles.middleBlackBoldTextStyle,
                    ),
                    8.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          "Internet Facility",
                          alignment: Alignment.centerLeft,
                          // textStyle: AppTextStyles.middleBlackBoldTextStyle,
                        ),
                        CustomToggleSwitch(
                          value: _switchValue1.value,
                          onChanged: (bool value) {
                            _switchValue1.value = value;
                          },
                        ),
                      ],
                    ),
                     8.ph,
                      CustomTextField(
                        label: "Remarks",
                        fillColor: AppColors.primaryWhite,
                        // controller: email,
                        textCapitalization: TextCapitalization.sentences,
                        validator: Validator.validateValue,
                      ),
                    8.ph,
                    Row(
                      children: [
                        const Expanded(
                          child: CustomText(
                            'Picture of CCTV dashboard',
                            alignment: Alignment.centerLeft,
                     // textStyle: AppTextStyles.middleBlackBoldTextStyle,

                          ),
                        ),CustomToggleSwitch(
                  value: _switchValue2.value,
                  onChanged: (bool value) {
                    _switchValue2.value = value;
                  },
                ),
                      ],   
                    ),
                  8.ph,
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: "Remarks",
                            fillColor: AppColors.primaryWhite,
                          //  borderColor: AppColors.primaryBlack,
                            controller: source.resumePath,
                           // enabled: false,
                            textCapitalization: TextCapitalization.none,
                          ),
                        ),
                        6.pw,
                        ClipBox(
                          //width: 373,
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
                        const Expanded(
                          child: CustomText(
                            'Biometric Device Installed',
                            alignment: Alignment.centerLeft,
                     // textStyle: AppTextStyles.middleBlackBoldTextStyle,
                          ),
                        ),CustomToggleSwitch(
                  value: _switchValue3.value,
                  onChanged: (bool value) {
                    _switchValue3.value = value;
                  },
                ),
                      ],   
                    ),
                      
                    6.pw,
                        ClipBox(
                            width:373,
                          onTap: () {
                            source.pickResume();
                          },
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
                        const Expanded(
                          child: CustomText(
                            'Is Biometric Device Sync?',
                            alignment: Alignment.centerLeft,
                     // textStyle: AppTextStyles.middleBlackBoldTextStyle,
                          ),
                        ),CustomToggleSwitch(
                  value: _switchValue4.value,
                  onChanged: (bool value) {
                    _switchValue4.value = value;
                  },
                ),
                      ],   
                    ),

                    8.ph,
                      CustomTextField(
                        label: "Remarks",
                        fillColor: AppColors.primaryWhite,
                        // controller: email,
                        textCapitalization: TextCapitalization.sentences,
                        validator: Validator.validateValue,
                      ),
                    
                     8.ph,
                    Row(
                      children: [
                        const Expanded(
                          child: CustomText(
                            'All students registered in Biometric   ',
                            alignment: Alignment.centerLeft,
                     // textStyle: AppTextStyles.middleBlackBoldTextStyle,
                          ),
                        ),CustomToggleSwitch(
                  value: _switchValue2.value,
                  onChanged: (bool value) {
                    _switchValue2.value = value;
                  },
                ),
                      ],   
                    ),
                      
                    8.ph,
                   PrimaryButton(
                      onTap: () {
                        if (!formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const InstituteFacilities3()),
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
