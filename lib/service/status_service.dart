import 'package:app_jam_deneme_1/model/status.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StatusService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Project> addStatus(
      String alan, String ekipSayisi, String projeDetay) async {
    var ref = _firestore.collection("Project");

    var documentRef = await ref.add({
      'alan': alan,
      'ekipSayisi': ekipSayisi,
      'projeDetay': projeDetay,
    });
    return Project(
        id: documentRef.id,
        alan: alan,
        ekipSayisi: ekipSayisi,
        projeDetay: projeDetay);
  }

  //proje göstermek için
  Stream<QuerySnapshot> getStatus() {
    var ref = _firestore.collection("Project").snapshots();

    return ref;
  }

  // proje silmek için
  Future<void> removeStatus(String docId) {
    var ref = _firestore.collection("Project").doc(docId).delete();

    return ref;
  }
}
