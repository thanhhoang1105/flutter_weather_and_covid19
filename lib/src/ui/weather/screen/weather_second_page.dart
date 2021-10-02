import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class WeatherSecondPage extends StatefulWidget {
  final String text;
  WeatherSecondPage({ required this.text});
  @override
  _WeatherSecondPageState createState() => _WeatherSecondPageState();
}

class _WeatherSecondPageState extends State<WeatherSecondPage> {
  var temp;
  var description;
  var currently;
  var humidity;
  var windspeed;

  Future getweather() async {
    http.Response response = await http.get(Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=${widget.text}&units=metric&appid=15044dc8c956cfb4fb12da54b2bb5c2c"));
    var results = jsonDecode(response.body);
    print("HEllo");
    print(widget.text);
    setState(() {
      this.temp = results['main']['temp'];
      this.description = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windspeed = results['wind']['speed'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getweather();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2.2,
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage('assets/weather.gif'),
                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.6),
                        BlendMode.dstATop
                    ),
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(
                          FontAwesomeIcons.search,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40, bottom: 20),
                        child: Text(
                          "Currently in ",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              fontFamily: 'JosefinSans'
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        widget.text.toUpperCase(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                            fontFamily: 'JosefinSans'
                        ),
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Row(
                                children: <Widget>[
                                  Icon(Icons.thermostat_rounded),
                                  Text(
                                    temp != null ? temp.toString() + "\u00b0" : "Loading",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30.0,
                                      //fontWeight: FontWeight.w700,
                                      fontFamily: 'JosefinSans',
                                      letterSpacing: 3,
                                    ),
                                  ),
                                ]
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Row(
                                children: <Widget>[
                                  Icon(Icons.cloud_circle_sharp),
                                  SizedBox(width: 10,),
                                  Text(
                                    currently != null? currently.toString() : "Loading",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30.0,
                                        //fontWeight: FontWeight.w700,
                                        fontFamily: 'JosefinSans'
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ],
                      ),
                    ]
                ),
              ),
              Expanded(
                child: Container(
                    color: Color.fromRGBO(236, 229, 220, 0.6),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(30, 50, 30, 80),
                      //color: Colors.red,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        color: Colors.white,
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
                      //child: Padding(
                      //padding: EdgeInsets.all(30.0),
                      child: ListView(
                        children: <Widget>[
                          ListTile(
                            leading: FaIcon(
                                FontAwesomeIcons.thermometerHalf,
                                color: Colors.black
                            ),
                            title: Text(
                                "Temperature",
                                style: TextStyle(
                                    fontFamily: 'Syne',
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            trailing: Text(
                                temp != null ? temp.toString() + "\u00b0" : "Loading",
                                style: TextStyle(fontSize: 15)
                            ),
                          ),
                          ListTile(
                            leading: FaIcon(
                                FontAwesomeIcons.cloud,
                                color: Colors.black
                            ),
                            title: Text(
                                "Weather",
                                style: TextStyle(
                                    fontFamily: 'Syne',
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            trailing: Text(
                                description != null ? description.toString() : "Loading",
                                style: TextStyle(fontSize: 15)),
                          ),
                          ListTile(
                            leading: FaIcon(
                                FontAwesomeIcons.sun,
                                color: Colors.black
                            ),
                            title: Text(
                                "Humidity",
                                style: TextStyle(
                                    fontFamily: 'Syne',
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            trailing: Text(
                                humidity != null ? humidity.toString() + "%" : "Loading",
                                style: TextStyle(fontSize: 15)
                            ),
                          ),
                          ListTile(
                            leading: FaIcon(
                                FontAwesomeIcons.wind,
                                color: Colors.black
                            ),
                            title: Text(
                                "Wind Speed",
                                style: TextStyle(
                                    fontFamily: 'Syne',
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            trailing: Text(
                                windspeed != null? windspeed.toString() + "m/s" : "Loading",
                                style: TextStyle(fontSize: 15)),
                          ),
                        ],
                      ),
                    )
                ),
              ),
            ]
        ),
      );
  }
}