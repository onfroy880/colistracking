import 'package:colistracking/mics/app_title.dart';
import 'package:colistracking/mics/custome_drawer.dart';
import 'package:colistracking/screens/home/bloc/home_bloc.dart';
import 'package:colistracking/screens/home/bloc/home_event.dart';
import 'package:colistracking/screens/home/bloc/home_state.dart';
import 'package:colistracking/screens/home/pecuwi/home_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: ((context, state) {
      BlocProvider.of<HomeBloc>(context).add(HomeEvent());
      return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.sort_rounded),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: AppTitle(
            text: 'Colis Tracker',
            color: Colors.purple,
          ),
          actions: [
            IconButton(
              onPressed: () {
                BlocProvider.of<HomeBloc>(context).add(HomeEventReload());
              },
              icon: const Icon(Icons.replay),
            ),
            SizedBox(width: 18.w),
          ],
          elevation: 0.0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.purple,
        ),
        drawer: CustomDrawer(),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(18.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitle(text: 'Suivi'),
              SizedBox(width: 18.w),
              for (int item = 0; item < state.data.length; item++)
                HomeItemWidget(item: [state.data[item]]),
            ],
          ),
        ),
      );
    }));
  }
}
