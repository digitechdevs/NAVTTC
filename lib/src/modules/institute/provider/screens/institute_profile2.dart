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

class InstituteProfile2 extends HookConsumerWidget {
  const InstituteProfile2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _switchValue1 = useState(false);
    final _switchValue2 = useState(false);
       


    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    var source = ref.watch(instructorProvider);

    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            const ScreenHeaderWithButton(),
            8.ph,
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
                     8.ph,
                    Row(
                      children: [
                        const Expanded(
                          child: SelectableTile(
                            title: 'Is Registered',
                            showIcon: false,
                            selected: false,
                            
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
                          child: SelectableTile(
                            title: 'Is Affiliated',
                            selected: false,
                            showIcon: false,
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
                        const Expanded(
                          child: SelectableTile(
                            title: 'Is Registered',
                            showIcon: false,
                            selected: false,
                            
                          ),
                          
                          
                        ),
                      ],
                    ),
                     8.ph,
                    Row(
                      children: [
                        Expanded(
                          child: SelectableTile(
                            title: 'Is Affiliated',
                            selected: false,
                            showIcon: false,
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
                          // Handle the form submission
                        } else {
                          Prompts.popMessenger("Please input correct information");
                        }
                      },
                      text: 'SAVE',
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
