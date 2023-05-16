import 'package:app_jam_deneme_1/home_page.dart';
import 'package:app_jam_deneme_1/profile_unity.dart';
import 'package:app_jam_deneme_1/unity_new_project.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'newDraw.dart';

class ProjeAraScreenU extends StatelessWidget {
  const ProjeAraScreenU({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: NewDraw(),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'PROJELER',
            style: TextStyle(
              fontSize: 27.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Projeler(),
      ),
    );
  }
}

class Projeler extends StatefulWidget {
  const Projeler({Key? key}) : super(key: key);

  @override
  State<Projeler> createState() => _ProjelerState();
}

class _ProjelerState extends State<Projeler> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          CarouselSlider(
            items: [
              // First
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    //height: MediaQuery.of(context).size.height / 2,
                    height: 300,
                    child: Image.asset(
                      'assets/person3.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sena Tekin',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Kars',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.location_on),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Unity',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            color: Colors.blue[700],
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Simülasyon',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            color: Colors.green,
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                '3D',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            color: Colors.red[700],
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                '5+ Kişi',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            color: Colors.yellow[700],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Proje Adı:  Ancient World City Manager',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        'KONU: Şehir yönetme simülasyonu yapmaya çalışıyorum. Ortaçağ, Antik Mısır, Rönesans gibi dönemlere göre farklı şehir planları olacak.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                  'Katılma isteğiniz proje sahibine gönderilmiştir.'),
                              content: const Text(
                                  'Katılma isteğiniz kabul edildiğinde bildirim alacaksınız.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text(
                          'KATIL',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Second
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    //height: MediaQuery.of(context).size.height / 2,
                    height: 300,
                    child: Image.asset(
                      'assets/person5.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Burak Şen',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Hatay',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.location_on),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Unity',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            color: Colors.blue[700],
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Bulmaca',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            color: Colors.green,
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                '3D',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            color: Colors.red[700],
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                '2-3 Kişi',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            color: Colors.yellow[700],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Proje Adı:  Piramitlerin Sırrı: Arkeologun Kaçışı',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        'KONU:  Karakterimiz bir arkeolog. Mısırda kazısında görevli olduğu piramitte kapalı kalıyor. Farklı odalarında bulmacaları çözerek piramitten kurtulmaya çalışıyor ve o sırada piramitin sırlarını da keşfediyor.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                  'Katılma isteğiniz proje sahibine gönderilmiştir.'),
                              content: const Text(
                                  'Katılma isteğiniz kabul edildiğinde bildirim alacaksınız.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text(
                          'KATIL',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Third
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    //height: MediaQuery.of(context).size.height / 2,
                    height: 300,
                    child: Image.asset(
                      'assets/person6.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Reyhan Irmak',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Uşak',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.location_on),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Unity',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            color: Colors.blue[700],
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'RYO',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            color: Colors.green,
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                '2D',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            color: Colors.red,
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                '4-5 Kişi',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            color: Colors.yellow[700],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Proje Adı:  Fertile Grounds',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        'KONU: Çiftlik simülasyonu yapmak istiyorum. Oyun ilerledikçe hikayesi oluşturulacak.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                  'Katılma isteğiniz proje sahibine gönderilmiştir.'),
                              content: const Text(
                                  'Katılma isteğiniz kabul edildiğinde bildirim alacaksınız.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text(
                          'KATIL',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
            options: CarouselOptions(
              height:
                  736, //Flutter Inspectorla List View'un kapladığı alana ayarladım.
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

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
                backgroundImage: AssetImage('assets/profilfoto.jpg'),
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
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'tugbayildiz@gmail.com',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
              title: const Text('Anasayfa'),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Draw())),
            ),
            ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profilim'),
                onTap: () => {
                      //Navigator.pop(context),
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => UProfilim())),
                    }),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Unity Projesi Oluştur'),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => UnityNewProject())),
            ),
            ListTile(
              leading: const Icon(Icons.info_sharp),
              title: const Text('Hakkımızda'),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Çıkış'),
            ),
          ],
        ),
      );
}
