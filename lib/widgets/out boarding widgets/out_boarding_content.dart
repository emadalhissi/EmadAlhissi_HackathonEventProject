import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutBoardingContent extends StatelessWidget {
  const OutBoardingContent({
    Key? key,
    required this.imageName,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String imageName;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.w, right: 40.w),
          width: 300.w,
          height: 320.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$imageName'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 35.h),
        Container(
          padding: EdgeInsets.only(left: 37.w, right: 37.w),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff040404),
                ),
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.center,
                child: Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xff707070),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
