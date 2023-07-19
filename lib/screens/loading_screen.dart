import 'package:flutter/material.dart';
import 'package:weatherrr/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late http.Response response; // Declare the response variable here

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    print(location.latitude);
    print(location.longitude);
    
  }

  void getData() async {
    response = await http.get(Uri.parse(
        'api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=6777dc51388a56bffc2b1427b7927d06'));

    if (response.statusCode == 200) {
      String data = response.body;

      var longitude = jsonDecode(data)['coord']['lon'];
      
      print(data);
    } else {
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: getLocation,
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
