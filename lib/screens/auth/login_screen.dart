import 'package:emad_alhissi_hackathon/api/controllers/auth_api_controller.dart';
import 'package:emad_alhissi_hackathon/shared_preferences/shared_preferences_controller.dart';
import 'package:emad_alhissi_hackathon/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _mobileEditingController;
  late TextEditingController _passwordEditingController;

  @override
  void initState() {
    super.initState();
    _mobileEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _mobileEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 160.h),
            Center(
              child: Text(
                'UCAS Events',
                style: TextStyle(
                  fontSize: 35.sp,
                  color: Color(0XFF253975),
                  fontFamily: 'Pacifico',
                ),
              ),
            ),
            SizedBox(height: 50.h),
            Text(
              'Welcome to back',
              style: TextStyle(
                color: Color(0xff443F5D),
                fontSize: 11.sp,
                fontFamily: 'Cairo',
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Login with',
              style: TextStyle(
                color: Color(0xff253975),
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              'Phone',
              style: TextStyle(
                color: Color(0xff040404),
                fontSize: 15.sp,
              ),
            ),
            SizedBox(height: 10.h),
            InputTextField(
              hint: 'Enter your phone',
              editingController: _mobileEditingController,
              obscure: false,
              borderColor: Color(0xff707070),
              function: () {
                setState(() {
                  _mobileEditingController;
                });
              },
            ),
            SizedBox(height: 23.h),
            Text(
              'Password',
              style: TextStyle(
                color: Color(0xff040404),
                fontSize: 15.sp,
              ),
            ),
            SizedBox(height: 10.h),
            InputTextField(
              hint: '*********',
              editingController: _passwordEditingController,
              obscure: true,
              borderColor: Color(0xff707070),
              function: () {
                setState(() {
                  _passwordEditingController;
                });
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () => performLogin(),
              child: Text('Sing in'),
              style: ElevatedButton.styleFrom(
                  primary: Color(0xff253975),
                  minimumSize: Size(double.infinity, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  )),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

    Future<void> performLogin() async {
      if (checkData()) {
        await login();
      }
    }

    bool checkData() {
      if (_mobileEditingController.text.isNotEmpty &&
          _passwordEditingController.text.isNotEmpty) {
        return true;
      }
      return false;
    }

    Future<void> login() async {

      bool status = await AuthApiController().login(
        context,
        mobile: _mobileEditingController.text,
        password: _passwordEditingController.text,
      );
      if (status) {
        print('test');
        SharedPreferencesController().login();
        Future.delayed(const Duration(seconds: 1), () {
          // SharedPreferencesController().setFirstVisit();
          Navigator.pushReplacementNamed(context, '/categories_screen');
        });
      }
    }
}
