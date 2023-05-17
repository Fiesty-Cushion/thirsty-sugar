import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class RoutineView extends StatefulWidget {
  const RoutineView({Key? key}) : super(key: key);

  @override
  State<RoutineView> createState() => _RoutineViewState();
}

class _RoutineViewState extends State<RoutineView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 3,
      length: 6,
      child: Scaffold(
          backgroundColor: HexColor('#F0F0F0'),
          appBar: AppBar(
            toolbarHeight: 50,
            automaticallyImplyLeading: false,
            title: const TabBar(
              splashFactory: InkRipple.splashFactory,
              splashBorderRadius: BorderRadius.all(Radius.elliptical(20.0, 60.0)),
              indicatorColor: Colors.red,
              indicatorWeight: 5,
              isScrollable: true,
              tabs: [
                Tab(
                  text: 'Sunday',
                ),
                Tab(
                  text: 'Monday',
                ),
                Tab(
                  text: 'Tuesday',
                ),
                Tab(
                  text: 'Wednesday',
                ),
                Tab(
                  text: 'Thursday',
                ),
                Tab(
                  text: 'Friday',
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(
                child: Text('It\'s Sunday'),
              ),
              Center(
                child: Text('It\'s Monday'),
              ),
              Center(
                child: Text('It\'s Tuesday'),
              ),
              Center(
                child: Text('It\'s Wednesday'),
              ),
              Center(
                child: Text('It\'s Thursday'),
              ),
              Center(
                child: Text('It\'s Friday'),
              ),
            ],
          )),
    );
  }
}
