// ignore_for_file: must_be_immutable

import 'package:colistracking/mics/app_title.dart';
import 'package:colistracking/screens/add/add_screen.dart';
import 'package:colistracking/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);
  Color color = Colors.purple;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      width: MediaQuery.of(context).size.width - 50.w,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(25.w)),
        ),
        margin: EdgeInsets.only(top: 50.w),
        padding: EdgeInsets.all(20.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: color,
                ),
              ),
              SizedBox(height: 25.w),
              Center(
                child: Icon(
                  Icons.person_2,
                  size: 60.w,
                  color: color,
                ),
              ),
              SizedBox(height: 5.w),
              Container(
                height: 2.w,
                width: MediaQuery.of(context).size.width,
                color: color,
              ),
              SizedBox(height: 45.w),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                    (route) => false,
                  );
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.store,
                      color: Colors.purple,
                    ),
                    SizedBox(width: 20.w),
                    AppTitle(
                      text: 'Liste des colis',
                      // color: color,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.w),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddScreen(),
                    ),
                    (route) => false,
                  );
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.add_box_rounded,
                      color: Colors.purple,
                    ),
                    SizedBox(width: 20.w),
                    AppTitle(
                      text: 'Demande de collecte',
                      // color: color,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
