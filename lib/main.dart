import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navttc/src/core/utils/app_exports.dart';
import 'package:navttc/src/modules/authentication/presentation/screens/login_screen.dart';
import 'package:navttc/src/modules/institute/provider/screens/institue_detail.dart';
import 'package:navttc/src/modules/institute/provider/screens/institue_home.dart';
import 'package:navttc/src/modules/instructor/presentation/screens/instructor_attendance_history.dart';
import 'package:navttc/src/modules/instructor/presentation/screens/instructor_home.dart';
import 'package:navttc/src/modules/student/presentation/screens/student_attendance.dart';
import 'package:navttc/src/modules/student/presentation/screens/student_home.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(
    const ProviderScope(
      child: Navttc(),
    ),
  );
}

class Navttc extends StatelessWidget {
  const Navttc({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'NAVTTC',
        navigatorKey: AppRouter.navKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          useMaterial3: true,
        ),
        home: const InstituteHome(),
      ),
    );
  }
}
