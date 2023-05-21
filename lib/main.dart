import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

import 'Pages/flutter_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Grock.navigationKey,
      debugShowCheckedModeBanner: false,
      home: FlutterListPage(),
    );
  }
}
