import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  String id;
  String alan;
  String ekipSayisi;
  String projeDetay;

  Project(
      {required this.id,
      required this.alan,
      required this.ekipSayisi,
      required this.projeDetay});

  factory Project.fromSnapshot(DocumentSnapshot snapshot) {
    return Project(
        id: snapshot.id,
        alan: snapshot["alan"],
        ekipSayisi: snapshot["ekipSayisi"],
        projeDetay: snapshot["projeDetay"]);
  }
}
