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

class Institutetrade4 extends HookConsumerWidget {
  const Institutetrade4({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _switchValue = useState(false);
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
                      "Trades 4/4",
                      alignment: Alignment.center,
                      textStyle: AppTextStyles.middleBlackBoldTextStyle,
                    ),
                    8.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomText(
                          
                          "NAVTTC TLMs were Provided to the trainees ",
                          alignment: Alignment.centerLeft,
                          // textStyle: AppTextStyles.middleBlackBoldTextStyle,
                        ),
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
                            'Weekly/Monthly Lesson Plans Provided to the Trainees',
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
                            'Trainees were well versed with course content  ',
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
                            'Consumable/training material was provided to the trainees for practice purpose ',
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
                   PrimaryButton(
                      onTap: () {
                         if (!formKey.currentState!.validate());
                        //  {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => const InstituteFacilities2()),
                        //   );
                        // } 
                        else {
                          Prompts.popMessenger("Please input correct information");
                        }
                      },
                      text: 'SAVE',
                    ),
                    SizedBox(height: kBottomNavigationBarHeight),
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
