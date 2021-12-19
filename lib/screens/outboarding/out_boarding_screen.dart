import 'package:emad_alhissi_hackathon/widgets/out%20boarding%20widgets/out_boarding_content.dart';
import 'package:emad_alhissi_hackathon/widgets/out%20boarding%20widgets/out_boarding_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  _OutBoardingScreenState createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Spacer(),
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0,
              maxWidth: 422.w,
              minHeight: 0,
              maxHeight: 540.h,
            ),
            child: PageView(
              // scrollBehavior: ScrollPhysics().,
              physics: const BouncingScrollPhysics(),
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(
                  () {
                    _currentPage = value;
                  },
                );
              },
              children: const [
                OutBoardingContent(
                  imageName: 'ob_1.png',
                  title: 'Subscribe events',
                  subTitle:
                      'by using this app you will subscribe your event easily and quickly.',
                ),
                OutBoardingContent(
                  imageName: 'ob_2.png',
                  title: 'Online payment',
                  subTitle:
                      'this app provide you to pay through multiple  methods such as:  Visa, PayPal and cash.',
                ),
                OutBoardingContent(
                  imageName: 'ob_3.png',
                  title: 'Create events',
                  subTitle:
                      'you can create your own event in the application free and invite your friends',
                ),
              ],
            ),
          ),
          // SizedBox(height: 40.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutBoardingIndicator(
                marginEnd: 8.w,
                selected: _currentPage == 0,
              ),
              OutBoardingIndicator(
                marginEnd: 8.w,
                selected: _currentPage == 1,
              ),
              OutBoardingIndicator(
                marginEnd: 8.w,
                selected: _currentPage == 2,
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: ElevatedButton(
              onPressed: _currentPage == 2
                  ? () {
                Navigator.pushReplacementNamed(
                    context, '/login_screen');
              }
                  : () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff253975),
                minimumSize: Size(double.infinity, 48.h),
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
