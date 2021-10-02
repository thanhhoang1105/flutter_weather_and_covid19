import 'package:flutter/material.dart';
import 'package:ggmap/src/constants/color.dart';
import 'package:ggmap/src/ui/covid_19/screen/navigation_option.dart';
import 'country.dart';
import 'global.dart';

enum NavigationStatus { GLOBAL, COUNTRY }

class Tracker extends StatefulWidget {
  const Tracker({Key? key}) : super(key: key);

  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  NavigationStatus navigationStatus = NavigationStatus.GLOBAL;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kPrimaryColors,
        elevation: 0,
        title: Text("Covid 19 App"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: kPrimaryColors,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50)),
              ),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
                child: navigationStatus == NavigationStatus.GLOBAL
                    ? Global()
                    : Country(),
              ),
            ),
          ),
          Container(
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NavigationOption(
                  title: "Thế Giới",
                  selected: navigationStatus == NavigationStatus.GLOBAL,
                  onSelected: () {
                    setState(() {
                      navigationStatus = NavigationStatus.GLOBAL;
                    });
                  },
                ),
                NavigationOption(
                  title: "Quốc Gia",
                  selected: navigationStatus == NavigationStatus.COUNTRY,
                  onSelected: () {
                    setState(() {
                      navigationStatus = NavigationStatus.COUNTRY;
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
