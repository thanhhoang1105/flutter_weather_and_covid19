import 'package:flutter/material.dart';
import 'package:ggmap/src/ui/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather & Covid',
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
              // bodyColor: Colors.white,
              // displayColor: Colors.blue,
              )),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
