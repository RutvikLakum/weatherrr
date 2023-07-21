import 'package:flutter/material.dart';
import 'package:weatherrr/screens/location_screen.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherrr/services/weather.dart';




class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {




  late http.Response response; 

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    
   var weatherData = await WeatherModel().getLocationweather();


Navigator.push(context, MaterialPageRoute(builder: (context) {
  return LocationScreen(locationWeather: weatherData,);
}));
  }
  
  

  @override
  Widget build(BuildContext context) {
    
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        )
      )
    );
  }

}



