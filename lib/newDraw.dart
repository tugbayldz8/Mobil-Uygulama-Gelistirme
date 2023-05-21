import 'package:app_jam_deneme_1/profile_flutter.dart';
import 'package:flutter/material.dart';

import 'Pages/name_surname.dart';
import 'about_us.dart';
import 'home_page.dart';
import 'loginPage.dart';
import 'model/home_weather.dart';

class NewDraw extends StatefulWidget {
  const NewDraw({Key? key}) : super(key: key);

  @override
  State<NewDraw> createState() => _NewDrawState();
}

class _NewDrawState extends State<NewDraw> {
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
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );
  Widget buildHeader(BuildContext context) => Material(
        color: Colors.grey.shade900,
        child: Container(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top, bottom: 24),
          child: Row(
            children: [
              CircleAvatar(
                radius: 52,
                backgroundImage: AssetImage('assets/imagess.jpg'),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    adSoyad,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    email,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(15),
        child: Wrap(
          runSpacing: 6,
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text(
                'Anasayfa',
              ),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Draw())),
            ),
            ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profilim'),
                onTap: () => {
                      //Navigator.pop(context),
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => FProfilim())),
                    }),
            ListTile(
              leading: const Icon(Icons.info_sharp),
              title: const Text('Hakkımızda'),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AboutUs())),
            ),
            ListTile(
              leading: const Icon(Icons.cloud),
              title: const Text('Hava Durumu'),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeScreen())),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Çıkış'),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage())),
            ),
          ],
        ),
      );
}
