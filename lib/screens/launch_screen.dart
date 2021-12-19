import 'package:emad_alhissi_hackathon/shared_preferences/shared_preferences_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      String route = SharedPreferencesController().loggedIn ? '/categories_screen' : '/login_screen';
      Navigator.pushReplacementNamed(context, route);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff253975),
      body: Center(
        child: Text(
          'Events',
          style: TextStyle(
            fontSize: 60.sp,
            color: Colors.white,
            fontFamily: 'Pacifico',
          ),
        ),
      ),
    );
  }
}
