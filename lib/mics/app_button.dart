import 'package:colistracking/mics/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  AppButton({
    Key? key,
    this.icon,
    this.text,
    this.size,
    this.isIcon = false,
    required this.color,
    required this.backgroundColor,
  }) : super(key: key);

  IconData? icon;
  String? text;
  final Color color;
  final Color backgroundColor;
  double? size;
  bool? isIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 28.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppTitle(
            text: text!,
            color: color,
          ),
          Icon(
            icon,
            color: color,
          ),
        ],
      ),
    );
  }
}
