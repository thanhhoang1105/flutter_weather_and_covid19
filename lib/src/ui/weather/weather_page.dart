import 'package:flutter/cupertino.dart';
import 'package:ggmap/src/ui/weather/screen/weather_first_page.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({ Key? key }) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return WeatherFirstPage();
  }
}