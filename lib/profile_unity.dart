import 'package:app_jam_deneme_1/Pages/flutter_list.dart';
import 'package:app_jam_deneme_1/views/contact_page.dart';
import 'package:app_jam_deneme_1/views/konum.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

import 'Pages/name_surname.dart';
import 'Pages/unity_add.dart';
import 'newDraw.dart';

class UProfilim extends StatefulWidget {
  const UProfilim({Key? key}) : super(key: key);

  @override
  State<UProfilim> createState() => _UProfilimState();
}

class _UProfilimState extends State<UProfilim> {
  void _showDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030));
  }

  Location location = Location();

  String adSoyad = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    getAdSoyad();
    getEmail();
  }

  void getAdSoyad() async {
    String result = await getAdSoyadFromFirestore();
    setState(() {
      adSoyad = result;
    });
  }

  void getEmail() async {
    String result = await getEmailFromFirestore();
    setState(() {
      email = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
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
                      height: 170,
                    ),
                    Positioned(left: 360, top: 200, child: Icon(Icons.edit)),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  adSoyad,
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
                                email,
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
                                'Unity',
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
                                builder: (context) => UnityAddPage()));
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
