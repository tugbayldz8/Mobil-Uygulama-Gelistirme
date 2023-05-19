import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

User? user = FirebaseAuth.instance.currentUser;
String? userId = user?.uid;

Future<String> getAdSoyadFromFirestore() async {
  String adSoyad = '';
  try {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('Person').doc(userId).get();
    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      adSoyad = data['userName'];
    }
  } catch (e) {
    print('Hata: $e');
  }
  return adSoyad;
}

Future<String> getEmailFromFirestore() async {
  String email = '';
  try {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('Person').doc(userId).get();
    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      email = data['email'];
    }
  } catch (e) {
    print('Hata: $e');
  }
  return email;
}
