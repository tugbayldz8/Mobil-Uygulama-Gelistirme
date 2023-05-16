import 'package:app_jam_deneme_1/Pages/flutter_add.dart';
import 'package:app_jam_deneme_1/service/status_service.dart';
import 'package:app_jam_deneme_1/views/contact_page.dart';
import 'package:app_jam_deneme_1/views/konum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

import 'Pages/flutter_list.dart';
import 'newDraw.dart';

class FProfilim extends StatefulWidget {
  const FProfilim({Key? key}) : super(key: key);

  @override
  State<FProfilim> createState() => _FProfilimState();
}

class _FProfilimState extends State<FProfilim> {
  StatusService _statusService = StatusService();
  final _firestore = FirebaseFirestore.instance;
  void _showDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030));
  }

  Location location = Location();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey.shade200,
          drawer: NewDraw(),
          appBar: AppBar(
            title: Text('Profilim'),
            backgroundColor: Colors.grey.shade900,
          ),
          body: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/fpp.jpg',
                        fit: BoxFit.cover,
                      ),
                      decoration: BoxDecoration(color: Colors.yellow),
                      width: 420,
                      height: 161,
                    ),
                    Positioned(left: 360, top: 200, child: Icon(Icons.edit)),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'TUĞBA YILDIZ',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Container(width: 300, child: Divider(color: Colors.black)),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            child: Icon(
                              Icons.mail_outline,
                              color: Colors.black,
                            ),
                            backgroundColor: Colors.grey.shade300,
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mail',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                              Text(
                                'tugbaay@gmail.com',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          CircleAvatar(
                            child: Icon(
                              Icons.account_balance,
                              color: Colors.black,
                            ),
                            backgroundColor: Colors.grey.shade300,
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Alan',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                              Text(
                                'Flutter',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          CircleAvatar(
                            child: Icon(
                              Icons.date_range,
                              color: Colors.black,
                            ),
                            backgroundColor: Colors.grey.shade300,
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: _showDatePicker,
                                child: Text(
                                  'Takvim',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black.withOpacity(0.9)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          CircleAvatar(
                            child: Icon(
                              Icons.fmd_good_outlined,
                              color: Colors.black,
                            ),
                            backgroundColor: Colors.grey.shade300,
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => KonumPage()));
                                },
                                child: Text(
                                  'Konum',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black.withOpacity(0.9)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            child: Icon(
                              Icons.people_alt_rounded,
                              color: Colors.black,
                            ),
                            backgroundColor: Colors.grey.shade300,
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ContactPage()));
                                },
                                child: Text(
                                  'Kişiler',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black.withOpacity(0.9)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 5),
                        ],
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(30, 50),
                              primary: Colors.grey.shade800),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FlutterAddPage()));
                          },
                          child: Text(
                            'Proje Oluştur',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(30, 50),
                              primary: Colors.grey.shade800),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FlutterListPage()));
                          },
                          child: Text(
                            'Projeye Katıl',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )),
                    ]),
              ],
            ),
          ),
        ));
  }
}
