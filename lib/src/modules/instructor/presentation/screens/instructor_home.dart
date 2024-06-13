import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navttc/src/components/bottom_rounded_header.dart';
import 'package:navttc/src/components/primary_button.dart';
import 'package:navttc/src/components/selectable_tile.dart';
import 'package:navttc/src/core/utils/app_exports.dart';
import 'package:navttc/src/modules/instructor/presentation/providers/instructor_provider.dart';

class InstructorHome extends StatelessWidget {
  const InstructorHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScreenHeader(showLogo: true),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.sp),
              child: Consumer(
                builder: (_, ref, child) {
                  var instructor = ref.watch(instructorProvider);
                  return Column(
                    children: [
                      30.ph,
                      ListView.separated(
                        itemCount: instructor.options.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: (_, i) {
                          return SelectableTile(
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
