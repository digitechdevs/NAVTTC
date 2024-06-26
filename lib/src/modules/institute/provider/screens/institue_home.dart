import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navttc/src/components/bottom_rounded_header.dart';
import 'package:navttc/src/components/primary_button.dart';
import 'package:navttc/src/components/selectable_tile.dart';
import 'package:navttc/src/core/utils/app_exports.dart';
import 'package:navttc/src/modules/authentication/presentation/screens/login_screen.dart';
import 'package:navttc/src/modules/institute/provider/institie_provider.dart';
import 'package:navttc/src/modules/institute/provider/screens/add_edit.dart';
import 'package:navttc/src/modules/institute/provider/screens/allied_other_facilities.dart';
import 'package:navttc/src/modules/institute/provider/screens/institue_detail.dart';
import 'package:navttc/src/modules/institute/provider/screens/institue_profile.dart';
import 'package:navttc/src/modules/institute/provider/screens/trade.dart';
import 'package:navttc/src/modules/instructor/presentation/providers/instructor_provider.dart';
import 'package:navttc/src/modules/instructor/presentation/screens/instructor_attendance_details.dart';
import 'package:navttc/src/modules/instructor/presentation/screens/instructor_attendance_history.dart';
import 'package:navttc/src/modules/instructor/presentation/screens/instructor_details.dart';

import 'add_edit2.dart';

class InstituteHome extends StatelessWidget {
  const InstituteHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScreenHeader(showLogo: false),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.sp),
              child: Consumer(
                builder: (_, ref, child) {
                  var instructor = ref.watch(instituteProvider);
                  instructor.clearInstructorDetails();
                  return Column(
                    children: [
                      30.ph,
                      ListView.separated(
                        itemCount: instructor.options.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: (_, i) {
                          return SelectableTile(
                            onTap: () {
                              if (i == 0) {
                                AppRouter.push(const InstituteDetail());
                              }
                              if (i == 1) {
                                AppRouter.push(const InstituteProfile());
                              }
                              if (i == 2) {
                                AppRouter.push(InstituteFacilities());
                              }
                              if (i == 3) {
                                AppRouter.push(Institutetrade());
                              }
                              if (i == 4) {
                                AppRouter.push(InstituteAddEdit2());
                              }},
                            title: instructor.options[i].title,
                            selected: instructor.options[i].selected,
                          );
                        },
                        separatorBuilder: (_, i) => 8.ph,
                      ),
                      58.ph,
                      PrimaryButton(
                        // loader: true,
                        text: "PREVIEW",
                        onTap: () {
                         // AppRouter.pushAndRemoveUntil(const LoginScreen());
                        },
                      ),
                      10.ph,
                      PrimaryButton(
                        // loader: true,
                        text: "SUBMIT",
                        onTap: () {
                         // AppRouter.pushAndRemoveUntil(const LoginScreen());
                        },
                      ),
                      50.ph,
                         PrimaryButton(
                        // loader: true,
                        text: "Log out",
                        onTap: () {
                         // AppRouter.pushAndRemoveUntil(const LoginScreen());
                        },
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
