// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:colistracking/mics/app_text.dart';
import 'package:colistracking/mics/app_title.dart';
import 'package:colistracking/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResumScreen extends StatefulWidget {
  ResumScreen({super.key, required this.information});
  List information;

  @override
  State<ResumScreen> createState() => _ResumScreenState();
}

class _ResumScreenState extends State<ResumScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 8), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => false,
      );
    });
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(18.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100.h),
            Center(
              child: Container(
                height: 100.w,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(50.r)),
                ),
                child: Icon(
                  Icons.done,
                  size: 80.w,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: AppText(
                text: 'Demande envoyee avec sucess !',
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20.h),
            AppTitle(
              text: 'Informations',
            ),
            SizedBox(height: 10.h),
            AppText(text: "Adresse de Colecte :  ${widget.information[0]}"),
            SizedBox(height: 10.h),
            AppText(text: "Contact Telephonique :  ${widget.information[1]}"),
            SizedBox(height: 10.h),
            AppText(text: "Detail du Colis :  ${widget.information[2]}"),
            SizedBox(height: 10.h),
            AppText(
                text: "Instruction particuliere :  ${widget.information[3]}"),
          ],
        ),
      ),
    );
  }
}
