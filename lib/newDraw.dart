import 'package:app_jam_deneme_1/profile_flutter.dart';
import 'package:app_jam_deneme_1/service/auth.dart';
import 'package:flutter/material.dart';

import 'about_us.dart';
import 'home_page.dart';
import 'loginPage.dart';

class NewDraw extends StatefulWidget {
  const NewDraw({Key? key}) : super(key: key);

  @override
  State<NewDraw> createState() => _NewDrawState();
}

class _NewDrawState extends State<NewDraw> {
  AuthService _authService = AuthService();

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
        color: Colors.black,
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
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tuğba Yıldız',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'tugba@gmail.com',
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
              leading: const Icon(Icons.logout),
              title: const Text('Çıkış'),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage())),
            ),
          ],
        ),
      );
}
