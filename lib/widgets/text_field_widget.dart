import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsafeclass/theme/pallete.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String text;
  final bool isPassword;
  final Widget? icon;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 15.sp,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            filled: true,
            fillColor: Pallete.fieldTextColor.withOpacity(.1),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(
                color: Pallete.fieldTextColor.withOpacity(.1),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: const BorderSide(
                color: Pallete.secondaryColor,
              ),
            ),
            contentPadding: const EdgeInsets.all(20),
            hintText: hintText,
            hintStyle: GoogleFonts.inter(
              color: Pallete.fieldTextColor,
            ),
            suffixIcon: icon,
          ),
        ),
      ],
    );
  }
}
