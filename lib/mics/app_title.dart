// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTitle extends StatelessWidget {
  String text;
  Color color;
  bool isFont;
  AppTitle({
    Key? key,
    this.color = Colors.black87,
    this.isFont = true,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        color: color,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
