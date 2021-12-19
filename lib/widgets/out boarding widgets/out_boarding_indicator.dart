import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutBoardingIndicator extends StatelessWidget {
  final double marginEnd;
  final bool selected;

  const OutBoardingIndicator({
    Key? key,
    required this.marginEnd,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? const Color(0xff2D3E74) : const Color(0xff2D3E74).withOpacity(0.3),
        borderRadius: BorderRadius.circular(10.r),
      ),
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      height: 8.h,
      width: 8.w,
    );
  }
}
