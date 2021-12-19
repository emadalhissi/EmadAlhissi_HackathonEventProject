import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key? key,
    required this.hint,
    required this.editingController,
    required this.obscure,
    required this.borderColor,
    required this.function,
  }) : super(key: key);

  final String hint;
  final TextEditingController editingController;
  final bool obscure;
  final Color borderColor;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return TextField(
      // expands: true,
      // minLines: null,
      // maxLines: null,

      controller: editingController,
      cursorColor: Color(0xff707070),
      decoration: InputDecoration(
        constraints: BoxConstraints(
          maxHeight: 60.h,
          maxWidth: double.infinity,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: Color(0xff9A9696),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
      ),
      obscureText: obscure,
    );
  }
}
