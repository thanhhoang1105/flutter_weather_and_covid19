import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ggmap/src/ui/weather/screen/weather_second_page.dart';
import 'package:http/http.dart' as http;

class WeatherFirstPage extends StatefulWidget {
  @override
  _WeatherFirstPageState createState() => _WeatherFirstPageState();
}

class _WeatherFirstPageState extends State<WeatherFirstPage> {
  //final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  // ignore: unused_field
  late Position _currentPosition;
  // ignore: unused_field
  var _currentAddress;
  late String lat;
  late String long;
  var city = new TextEditingController();
  var temp;
  var description;
  var currently;
  var humidity;
  var windspeed;
  var cityname;
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  _getCurrentLocation() async {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) async {
      setState(() {
        //_currentPosition = position;
        lat = position.latitude.toString();
        long = position.longitude.toString();
      });
      http.Response response = await http.get(Uri.parse(
          "http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&units=metric&lang=vi&appid=15044dc8c956cfb4fb12da54b2bb5c2c"));

      var results = jsonDecode(response.body);

      setState(() {
        this.temp = results['main']['temp'];
        this.description = results['weather'][0]['description'];
        this.currently = results['weather'][0]['main'];
        this.humidity = results['main']['humidity'];
        this.windspeed = results['wind']['speed'];
        this.cityname = results['name'];
      });
      print(lat);
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50),
              Column(children: <Widget>[
                Container(
                    width: double.infinity,
                    height: 200,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage('assets/img1.gif'),
                        fit: BoxFit.cover,
                      ),
                    )
                    //
                    ),
              ]),
              Container(
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text("Weather App",
                          style: TextStyle(
                              fontFamily: 'JosefinSans',
                              fontSize: 50,
                              fontWeight: FontWeight.bold)),
                      // SizedBox(height: 20),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: TextField(
                                controller: city,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0),
                                  ),
                                  hintText: 'Nhập Thành Phố',
                                  suffixIcon: IconButton(
                                    icon:
                                        Icon(Icons.search, color: Colors.black),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                WeatherSecondPage(
                                              text: city.text,
                                            ),
                                          ));
                                      print(city.text);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ]),
                      SizedBox(height: 40),
                      Container(
                        height: 200,
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        //color: Colors.black,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                          color: Color(0xff9FA8DA),
                          boxShadow: [
                            //background color of box
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 20.0, // soften the shadow
                              spreadRadius: -10.0, //extend the shadow
                              offset: Offset(
                                0.0, // Move to right 10  horizontally
                                0.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                cityname != null
                                    ? cityname.toString()
                                    : "Loading",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 45.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 3,
                                    fontFamily: 'JosefinSans'),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Row(children: <Widget>[
                                      Icon(Icons.thermostat_rounded),
                                      Text(
                                        temp != null
                                            ? temp.toString() + "\u00b0"
                                            : "Loading",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30.0,
                                          //fontWeight: FontWeight.w700,
                                          fontFamily: 'JosefinSans',
                                          letterSpacing: 3,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: Row(children: <Widget>[
                                      Icon(Icons.cloud_circle_sharp),
                                      Text(
                                        currently != null
                                            ? currently.toString()
                                            : "Loading",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 30.0,
                                            //fontWeight: FontWeight.w700,
                                            fontFamily: 'JosefinSans'),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
