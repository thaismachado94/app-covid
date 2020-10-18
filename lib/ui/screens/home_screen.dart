import 'package:app_covid/core/constants/const.dart';
import 'package:flutter/material.dart';
import '../screens/status_screen.dart';
import '../screens/state_screen.dart';
import '../screens/location_screen.dart';

enum StatusScreen {
  LOCATION,
  STATE,
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StatusScreen statusScreen = StatusScreen.LOCATION;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: myColorGeneric,
      appBar: AppBar(
        // elevation: 0,
        backgroundColor: myPrimaryColorbk,
        title: Text(
          "COVID",
          style: TextStyle(color: myColorGeneric),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: myPrimaryColorbk,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: statusScreen == StatusScreen.LOCATION
                    ? LocationScreen()
                    : StateScreen(),
              ),
            ),
          ),
          Container(
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OptionScreen(
                    title: "LOCATION",
                    selected: statusScreen == StatusScreen.LOCATION,
                    onSelected: () {
                      setState(() {
                        statusScreen = StatusScreen.LOCATION;
                      });
                    }),
                OptionScreen(
                    title: "COVID",
                    selected: statusScreen == StatusScreen.STATE,
                    onSelected: () {
                      setState(() {
                        statusScreen = StatusScreen.STATE;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
