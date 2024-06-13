import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navttc/src/core/utils/app_exports.dart';
import 'package:navttc/src/modules/authentication/presentation/screens/login_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        home: const LoginScreen(),
      ),
    );
  }
}
