import 'dart:io';

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
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () => getLocation(),
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                    child: Text("İzinler")),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () {
                  getLocation();
                  print(
                      'x: ${geolocatorController.currentLocation?.latitude}, y: ${geolocatorController.currentLocation?.longitude}');
                },
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                    child: Text('Konum Göster')),
              ),
            ],
          ),
        ));
  }

  getLocation() {
    Geolocator.requestPermission().then((request) {
      print("REQUEST : $request");
      if (Platform.isIOS) {
        if (request != LocationPermission.whileInUse) {
          print("NOT LOCATION PERMISSION");
          return;
        } else {
          print("PERMISSION OK");
          geolocatorController.permissionOK();
        }
      } else {
        if (request != LocationPermission.always) {
          print("NOT LOCATION PERMISSION");
          return;
        } else {
          print("PERMISSION OK");
          geolocatorController.permissionOK();
        }
      }
    });
  }
}
