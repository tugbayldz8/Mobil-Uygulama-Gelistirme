import 'package:app_jam_deneme_1/home_page.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 170,
                //margin: EdgeInsets.only(bottom: 20,),
                child: Image.asset(
                  'assets/logo.jpeg',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Kullanıcı Adı',
                    hintText: 'Lütfen akademi mailinizi giriniz.',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Şifre',
                    hintText: 'Lütfen akademi şifrenizi giriniz.',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Şifrenizi mi unuttunuz?'),
                      content: const Text(
                          'Lütfen info@oyunveuygulamaakademisi.com adresine mail atınız.'),
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
                  'Şifremi Unuttum',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.blue,
                ),
              ),
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Draw(),
                      ),
                    );
                  },
                  child: Text(
                    'Giriş',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
