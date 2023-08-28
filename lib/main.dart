import 'package:colistracking/screens/add/bloc/add_bloc.dart';
import 'package:colistracking/screens/detail/bloc/detail_bloc.dart';
import 'package:colistracking/screens/home/bloc/home_bloc.dart';
import 'package:colistracking/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(360, 460),
      minTextAdapt: true,
      splitScreenMode: true,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => HomeBloc())),
        BlocProvider(create: ((context) => DetailBloc())),
        BlocProvider(create: ((context) => AddBloc())),
        // BlocProvider(create: ((context) => StoreBloc())),
      ],
      child: MaterialApp(
        title: 'Colis Tracker',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
