// ignore_for_file: must_be_immutable

import 'package:colistracking/mics/app_text.dart';
import 'package:colistracking/mics/app_title.dart';
import 'package:colistracking/screens/detail/bloc/detail_bloc.dart';
import 'package:colistracking/screens/detail/bloc/detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key, required this.item});
  List item;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      builder: ((context, state) {
        return Scaffold(
          appBar: AppBar(
            title: AppTitle(
              text: 'Detail',
              color: Colors.purple,
            ),
            foregroundColor: Colors.purple,
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(18.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: widget.item[0]['trackinkNumber'].toString(),
                  color: Colors.grey,
                ),
                SizedBox(height: 8.h),
                AppTitle(text: 'Status :'),
                AppText(
                  text: widget.item[0]['status'].toString(),
                  // color: Colors.grey,
                ),
                SizedBox(height: 8.h),
                AppTitle(text: 'Location :'),
                AppText(
                  text: widget.item[0]['location'].toString(),
                  // color: Colors.grey,
                ),
                SizedBox(height: 8.h),
                AppTitle(text: 'Historique :'),
                for (int hist = 0;
                    hist < widget.item[0]['history'].length;
                    hist++)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text:
                            "Statut :  ${widget.item[0]['history'][hist]['status'].toString()}",
                        color: const Color.fromARGB(255, 98, 98, 98),
                      ),
                      AppText(
                        text:
                            "Date :  ${DateTime.parse(widget.item[0]['history'][hist]['timestamp'].toString())}",
                        color: const Color.fromARGB(255, 98, 98, 98),
                      ),
                      SizedBox(height: 5.h),
                    ],
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
