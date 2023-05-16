import 'anlik.dart';

class AnlikGunlukSaatlik {
  double? enlem;
  double? boylam;
  String? zamanDilimi;

  Anlik? anlik;
  List? saatlik;
  List? gunluk;

  AnlikGunlukSaatlik.fromJson(Map json) {
    this.enlem = json['lat'];
    this.boylam = json['lon'];
    this.zamanDilimi = json['timezone'];
    this.anlik = Anlik.fromJson(json['current']);
    this.saatlik = json['hourly'];
    this.gunluk = json['daily'];
  }
}
