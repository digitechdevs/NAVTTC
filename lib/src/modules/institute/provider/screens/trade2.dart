import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
import 'package:navttc/src/modules/institute/provider/screens/trade3.dart';
import 'package:navttc/src/modules/instructor/presentation/providers/instructor_provider.dart';
import 'package:navttc/src/services/app_services/field_services.dart';

import '../../../../components/custom_toggle_switch.dart';
import '../../../../components/prompts.dart';
import 'allied_other_facilities2.dart';
import 'instructor_trade_profile.dart';

class Institutetrade2 extends HookConsumerWidget {
  const Institutetrade2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var source = ref.watch(instructorProvider);

    void _showModalBottomSheet(BuildContext context) {
      showModalBottomSheet(

        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(41)),

        ),
          builder: (BuildContext context) {
            // double bottomSheetHeight = MediaQuery.of(context).size.height -
            //     (kToolbarHeight * 2.5);
            // double screenHeight = MediaQuery.of(context).size.height;
            // double bottomSheetHeight = screenHeight - (kToolbarHeight * 2.5);
            //
            // print('Screen height: $screenHeight');
            // print('kToolbarHeight: $kToolbarHeight');
            // print('Bottom sheet height: $bottomSheetHeight');

            return FractionallySizedBox(
              heightFactor: 0.8,
              child: Container(
              padding: EdgeInsets.all(16.0),
              //height: AppSize.screenHeight-(kToolbarHeight.h * 2.5),
              //   height: bottomSheetHeight,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      12.ph,

                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        10.pw,
                      CustomText(
                        "Instruction Detail",
                        alignment: Alignment.center,
                        textStyle: AppTextStyles.middleBlackBoldTextStyle,
                      ),
                      IconButton(
                        icon: Icon(CupertinoIcons.multiply),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                      ),


                    12.ph,
                    CustomTextField(
                      label: "Name",
                      fillColor: AppColors.primaryWhite,
                      textCapitalization: TextCapitalization.none,
                    ),
                    8.ph,
                    CustomTextField(
                      label: "CNIC",
                      fillColor: AppColors.primaryWhite,
                      textCapitalization: TextCapitalization.words,

                    ),
                    8.ph,
                    CustomTextField(
                      label: "BE",
                      fillColor: AppColors.primaryWhite,
                      textCapitalization: TextCapitalization.none,
                    ),
                    8.ph,
                    CustomTextField(
                      label: "Karachi, Korangi",
                      fillColor: AppColors.primaryWhite,
                      textCapitalization: TextCapitalization.none,
                    ),
                    8.ph,
                    CustomTextField(
                      label: "Phone",
                      fillColor: AppColors.primaryWhite,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.phone,
                    ),
                    8.ph,
                    CustomTextField(
                      label: "Remarks",
                      fillColor: AppColors.primaryWhite,
                      textCapitalization: TextCapitalization.none,
                    ),
                    8.ph,
                    ImageBox(
                      onTap: () {
                        source.captureImageOne();
                      },
                      pickedFile: source.loadedImageOne,
                    ),
                  ],
                ),
              ),
          ),
            );
        },
      );
    }

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
                      "Trades 2/4",
                      alignment: Alignment.center,
                      textStyle: AppTextStyles.middleBlackBoldTextStyle,
                    ),
                    8.ph,
                    GestureDetector(
                      onTap: () {
                        _showModalBottomSheet(context);
                      },
                      child: AbsorbPointer(
                        child: CustomTextField(
                          label: "Jawad Multani",
                          fillColor: AppColors.primaryWhite,
                          prefixIcon: Icon(Icons.person),
                          suffixIcon: Icon(Icons.edit_document),
                          textCapitalization: TextCapitalization.sentences,
                          enabled: false,
                        ),
                      ),
                    ),
                    8.ph,
                    CustomTextField(
                      label: "Assistant Instructor",
                      fillColor: AppColors.primaryWhite,
                      textCapitalization: TextCapitalization.sentences,
                      enabled: false,
                      prefixIcon: Icon(Icons.person),
                    ),
                    8.ph,
                    PrimaryButton(
                      onTap: () {
                        AppRouter.push(const Institutetrade3());

                        if (formKey.currentState!.validate()) ;
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
