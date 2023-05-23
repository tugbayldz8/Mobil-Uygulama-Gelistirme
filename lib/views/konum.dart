import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../controller/geolocator_controller.dart';

class KonumPage extends StatefulWidget {
  const KonumPage({Key? key}) : super(key: key);

  @override
  State<KonumPage> createState() => _KonumPageState();
}

class _KonumPageState extends State<KonumPage> {
  final geolocatorController = Get.put(GeolocatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konum'),
        backgroundColor: Colors.grey.shade900,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/harita.jpg'), // Resim dosyasının yolunu buraya girin
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.green),
            onPressed: () {
              LocGet();
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                child: Text('Konum Göster')),
          ),
        ),
      ),
    );
  }
}

void LocGet() async {
  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );

  double latitude = position.latitude;
  double longitude = position.longitude;

  print('Enlem: $latitude, Boylam: $longitude');
}
