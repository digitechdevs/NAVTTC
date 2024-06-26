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
import 'package:navttc/src/modules/instructor/presentation/providers/instructor_provider.dart';
import 'package:navttc/src/services/app_services/field_services.dart';

import '../../../../components/custom_toggle_switch.dart';
import '../../../../components/prompts.dart';
import 'allied_other_facilities2.dart';

class InstituteFacilities extends HookConsumerWidget {
  const InstituteFacilities({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _switchValue1 = useState(false);
    final _switchValue2 = useState(false);
    final _switchValue3 = useState(false);
    final _switchValue4 = useState(false);
    final _switchValue5 = useState(false);
    final _switchValue6 = useState(false);


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
                      "Allied/Other Facilities 1/2",
                      alignment: Alignment.center,
                      textStyle: AppTextStyles.middleBlackBoldTextStyle,
                    ),
                    8.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          "Admission Facilitation",
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
                            'Complaint Management System',
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
                            'Industrial Linkage',
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
                            'On Job Training Plans/Status',
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
                            'Availability of First Aid Box ',
                            alignment: Alignment.centerLeft,
                     // textStyle: AppTextStyles.middleBlackBoldTextStyle,
                          ),
                        ),CustomToggleSwitch(
                  value: _switchValue5.value,
                  onChanged: (bool value) {
                    _switchValue5.value = value;
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
                    Row(
                      children: [
                        const Expanded(
                          child: CustomText(
                            'Availability of First Aid Box ',
                            alignment: Alignment.centerLeft,
                     // textStyle: AppTextStyles.middleBlackBoldTextStyle,
                          ),
                        ),CustomToggleSwitch(
                  value: _switchValue6.value,
                  onChanged: (bool value) {
                    _switchValue6.value = value;
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
                   PrimaryButton(
                      onTap: () {
                        if (!formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const InstituteFacilities2()),
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
