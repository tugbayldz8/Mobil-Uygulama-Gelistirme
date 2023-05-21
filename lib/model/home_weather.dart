import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../newDraw.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cityName = 'Adana';
  String weatherData = '';

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    final apiKey =
        'a32814b07d1b13d90aa0f6035459e20e'; // OpenWeatherMap API anahtarını buraya ekleyin
    final url =
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&lang=tr&appid=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      final weatherDescription = decodedData['weather'][0]['description'];

      setState(() {
        weatherData = weatherDescription;
      });
    } else {
      setState(() {
        weatherData = 'Hava durumu verileri alınamadı';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NewDraw(),
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: Text('Hava Durumu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 100,
              color: Colors.purple,
              child: Center(
                child: Text(
                  'Şehir: $cityName',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: 200,
              height: 100,
              color: Colors.grey,
              child: Center(
                child: Text(
                  'Hava Durumu: $weatherData',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
