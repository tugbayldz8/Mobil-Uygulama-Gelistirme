import 'package:app_jam_deneme_1/newDraw.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          drawer: NewDraw(),
          appBar: AppBar(
            title: Text('BİZ KİMİZ?'),
            backgroundColor: Colors.black,
          ),
          body: Container(
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Misyonumuz',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(
                    thickness: 2,
                  ),
                  Text(
                    'Yazılımcıların projelerinde ihtiyaç duyacakları ekip arkadaşlarını kolayca bulmalarını sağlayarak, projelerini yürütmelerine yardımcı olmak ve başarılı bir şekilde gerçekleştirmelerine olanak tanımak. Ayrıca, yazılım üreticisini bir araya getirmek, bilgi ve deneyim aktarımlarına ve işbirliği yapmalarına olanak sağlamak. Hedefimiz, yazılım geliştirmeyi daha verimli, kolay ve keyifli hale getirmek.',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Vizyonumuz',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(
                    thickness: 2,
                  ),
                  Text(
                      'Yazılımcıların tasarımları için ekip arkadaşı bulmalarını kolaylaştıran bir uygulama olarak, en güncel teknolojik yenilikleri takip ederek, dünya genelindeki yazılım işletmesine liderlik etmek ve yazılım geliştiricileri için kapsamlı bir iş birliği platformu sunmak istiyoruz.',
                      style: TextStyle(fontSize: 15)),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Ekip Üyeleri',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow[700]),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'TUĞBA YILDIZ\nFURKAN ERALP KAHYAOĞLU\nBUĞRA BİLGE ÇELİK\nALPEREN TAN',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                      height: 150, child: Image.asset('assets/logo.jpeg')),
                ],
              )),
        ));
  }
}
