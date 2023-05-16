import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'anlik_gunluk_saatlik.dart';
import 'hava.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Apiden Veri çekme:'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _gelenCevap = "";
  AnlikGunlukSaatlik? _anlikGunlukSaatlik;

  Future<void> _incrementCounter() async {
    String adres =
        'https://api.openweathermap.org/data/2.5/onecall?lat=64.20084&lon=149.4936717&appid=5e6cd7584bee25e9d7f28e9edbbd0709&units=metric&lang=en&exclude=minutely';
    Response cevap = await get(Uri.parse(adres));

    if (cevap.statusCode == 200) {
      Map gelenJason = jsonDecode(cevap.body);
      _anlikGunlukSaatlik = AnlikGunlukSaatlik.fromJson(gelenJason);
      _gelenCevap = gelenJason['current']['weather'][0]['icon'];
    } else {
      _gelenCevap = "Bağlantıda bir sorun oluştu";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Text(
            'Gelen Cevap:',
            style: Theme.of(context).textTheme.headline4,
          ),
          if (_anlikGunlukSaatlik != null)
            for (Hava hava in (_anlikGunlukSaatlik?.anlik?.hava)!)
              Text(
                hava.olay.toString(),
                style: TextStyle(color: Colors.red, fontSize: 40),
              ),
          Text(
            '$_gelenCevap',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
