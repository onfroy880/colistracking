// ignore_for_file: must_be_immutable

import 'package:colistracking/mics/app_text.dart';
import 'package:colistracking/screens/detail/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeItemWidget extends StatefulWidget {
  HomeItemWidget({super.key, required this.item});
  List item;

  @override
  State<HomeItemWidget> createState() => _HomeItemWidgetState();
}

class _HomeItemWidgetState extends State<HomeItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(item: widget.item),
          ),
        );
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(8.w),
        margin: EdgeInsets.only(top: 8.w, bottom: 8.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 202, 201, 201),
              offset: Offset(0.5, 0.5),
              blurRadius: 1.5,
              spreadRadius: 1.0,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: widget.item[0]['trackinkNumber'].toString(),
              color: Colors.grey,
            ),
            SizedBox(width: 8.w),
            AppText(
              text: widget.item[0]['status'].toString(),
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }
}
