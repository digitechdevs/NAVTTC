import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navttc/src/components/bottom_rounded_header.dart';
import 'package:navttc/src/components/primary_button.dart';
import 'package:navttc/src/components/selectable_tile.dart';
import 'package:navttc/src/core/utils/app_exports.dart';
import 'package:navttc/src/modules/instructor/presentation/screens/instructor_attendance_details.dart';
import 'package:navttc/src/modules/instructor/presentation/screens/instructor_attendance_history.dart';
import 'package:navttc/src/modules/student/presentation/provider/student_provider.dart';
import 'package:navttc/src/modules/student/presentation/screens/student_attendance.dart';

class StudentHome extends StatelessWidget {
  const StudentHome({super.key});

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
                  var instructor = ref.watch(studentProvider);
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
                                AppRouter.push(const StudentAttendanceDetails());
                              }
                              if (i == 1) {
                                AppRouter.push(InstructorAttendanceHistory());
                              }
                            },
                            title: instructor.options[i].title,
                            selected: instructor.options[i].selected,
                          );
                        },
                        separatorBuilder: (_, i) => 8.ph,
                      ),
                      58.ph,
                      PrimaryButton(
                        // loader: true,
                        text: "LOG OUT",
                        onTap: () {},
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
