import 'package:app_covid/core/constants/const.dart';
import 'package:flutter/material.dart';
import '../widgets/optionScreen.dart';
import 'city_screen.dart';
import '../screens/location_screen.dart';

enum StatusScreen {
  LOCATION,
  CITY,
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
      resizeToAvoidBottomInset: false,
      backgroundColor: myPrimaryColortxt,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: myPrimaryColortxt,
        title: Text(
          "COVID - INTERIOR ",
          style: TextStyle(color: myPrimaryColorbk),
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
              ),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: statusScreen == StatusScreen.LOCATION
                    ? LocationScreen()
                    : CityScreen(),
              ),
            ),
          ),
          Container(
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OptionScreen(
                    title: "LOCAL",
                    selected: statusScreen == StatusScreen.LOCATION,
                    onSelected: () {
                      setState(() {
                        statusScreen = StatusScreen.LOCATION;
                      });
                    }),
                OptionScreen(
                    title: "CIDADES",
                    selected: statusScreen == StatusScreen.CITY,
                    onSelected: () {
                      setState(() {
                        statusScreen = StatusScreen.CITY;
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
