import 'package:flutter/material.dart';
import 'package:ggmap/src/ui/covid_19/screen/tracker.dart';

class Covid19Page extends StatefulWidget {
  const Covid19Page({ Key? key }) : super(key: key);

  @override
  _Covid19PageState createState() => _Covid19PageState();
}

class _Covid19PageState extends State<Covid19Page> {
  @override
  Widget build(BuildContext context) {
    return Tracker();
  }
}