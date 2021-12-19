import 'package:emad_alhissi_hackathon/screens/auth/login_screen.dart';
import 'package:emad_alhissi_hackathon/screens/categories_screen.dart';
import 'package:emad_alhissi_hackathon/screens/create_event_screen.dart';
import 'package:emad_alhissi_hackathon/screens/launch_screen.dart';
import 'package:emad_alhissi_hackathon/screens/outboarding/out_boarding_screen.dart';
import 'package:emad_alhissi_hackathon/shared_preferences/shared_preferences_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesController().initSharedPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/launch_screen',
        routes: {
          '/launch_screen': (context) => const LaunchScreen(),
          '/out_boarding_screen': (context) => const OutBoardingScreen(),
          '/login_screen': (context) => const LoginScreen(),
          '/categories_screen': (context) => const CategoriesScreen(),
          '/create_event_screen': (context) => const CreateEvenScreen(),
        },
        // supportedLocales: const [
        //   Locale('ar'),
        //   Locale('en'),
        // ],
        localizationsDelegates: [

        ],
        locale: Locale('en'),
      ),
    );
  }
}
