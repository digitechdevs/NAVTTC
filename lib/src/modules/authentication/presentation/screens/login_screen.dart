import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:navttc/src/components/bottom_rounded_header.dart';
import 'package:navttc/src/components/custom_text.dart';
import 'package:navttc/src/components/custom_textfield.dart';
import 'package:navttc/src/components/primary_button.dart';
import 'package:navttc/src/components/prompts.dart';
import 'package:navttc/src/core/theme/app_textstyles.dart';
import 'package:navttc/src/core/utils/app_enums.dart';
import 'package:navttc/src/core/utils/app_exports.dart';
import 'package:navttc/src/core/utils/validator.dart';
import 'package:navttc/src/modules/authentication/presentation/providers/auth_provider.dart';
import 'package:navttc/src/modules/institute/provider/screens/institue_home.dart';
import 'package:navttc/src/modules/instructor/presentation/screens/instructor_home.dart';
import 'package:navttc/src/modules/student/presentation/screens/student_home.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(context) {
    var email = useTextEditingController();
    var pass = useTextEditingController();
    var id = useTextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScreenHeader(),
            30.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.sp),
              child: Consumer(
                builder: (_, ref, child) {
                  var auth = ref.watch(authProvider);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        "Select Account",
                        alignment: Alignment.centerLeft,
                        textStyle: AppTextStyles.headBlackBoldTextStyle,
                      ),
                      7.ph,
                      CustomText(
                        "Following accounts have been registered with this mobile number",
                        alignment: Alignment.centerLeft,
                        textStyle: AppTextStyles.middleLightBlackTextStyle,
                      ),
                      23.ph,
                      CupertinoSlidingSegmentedControl(
                        children: {
                          Role.Institute.name: Text(Role.Institute.name),
                          Role.Instructor.name: Text(Role.Instructor.name),
                          Role.Monitoring.name: Text(Role.Monitoring.name),
                          Role.Student.name: Text(Role.Student.name),
                        },
                        groupValue: auth.selectedRole,
                        onValueChanged: auth.onRoleChanged,
                      ),
                      34.ph,
                      // if (auth.selectedRole == Role.Instructor.name ||
                      //     auth.selectedRole == Role.Student.name || auth.selectedRole == Role.Institute.name)
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              if (auth.selectedRole == Role.Institute.name)
                              CustomText(
                                "Institute Id",
                                alignment: Alignment.centerLeft,
                                textStyle: AppTextStyles.middleBlackTextStyle,
                              ),
                              if (auth.selectedRole == Role.Institute.name)
                              18.ph,
                              if (auth.selectedRole == Role.Institute.name)
                              CustomTextField(
                                label: "Institute Id",
                                controller: id,
                                textCapitalization: TextCapitalization.none,
                                validator: Validator.validateEmpty,
                              ),
                              if (auth.selectedRole == Role.Institute.name)
                              30.ph,
                              CustomText(
                                "Your email",
                                alignment: Alignment.centerLeft,
                                textStyle: AppTextStyles.middleBlackTextStyle,
                              ),
                              18.ph,
                              CustomTextField(
                                label: "youremail@domain.com",
                                controller: email,
                                textCapitalization: TextCapitalization.none,
                                validator: Validator.validateEmail,
                              ),
                              30.ph,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    "Password",
                                    alignment: Alignment.centerLeft,
                                    textStyle:
                                        AppTextStyles.middleBlackTextStyle,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: CustomText(
                                      "Forgot Password?",
                                      alignment: Alignment.centerRight,
                                      textStyle: AppTextStyles
                                          .middleBlackBoldTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                              6.ph,
                              CustomTextField(
                                label: "Enter your password",
                                controller: pass,
                                validator: Validator.validatePass,
                                obscureText: auth.isObscure,
                                suffixIcon: GestureDetector(
                                  onTap: auth.onObscure,
                                  child: Container(
                                    margin:
                                        EdgeInsets.all(AppSize.paddingRight),
                                    child: SvgPicture.asset(
                                      !auth.isObscure
                                          ? AppAssets.inVisible
                                          : AppAssets.visible,
                                    ),
                                  ),
                                ),
                              ),
                              18.ph,
                              InkWell(
                                onTap: auth.onCheck,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      auth.checked
                                          ? Icons.check_box_outlined
                                          : Icons
                                              .check_box_outline_blank_outlined,
                                    ),
                                    CustomText(
                                      "  Remember Me",
                                      alignment: Alignment.centerRight,
                                      textStyle: AppTextStyles
                                          .middleBlackBoldTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                              48.ph,
                              PrimaryButton(
                                // loader: true,
                                text: "LOGIN",
                                onTap: () {
                                  if (!formKey.currentState!.validate()) {
                                    if (auth.selectedRole == Role.Instructor.name) {
                                      AppRouter.pushReplace(const InstructorHome());
                                    } else if (auth.selectedRole == Role.Student.name) {
                                      AppRouter.pushReplace(const StudentHome());
                                    }

                                    else if (auth.selectedRole == Role.Institute.name) {
                                      AppRouter.pushReplace(const InstituteHome());
                                    }
                                  } else {
                                    Prompts.popMessenger("Please input correct information");
                                  }
                                },
                              ),
                              kBottomNavigationBarHeight.ph
                            ],
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
