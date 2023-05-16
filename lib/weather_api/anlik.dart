import 'hava.dart';

class Anlik {
  double? sicaklik;
  int? zaman;

  List? hava;

  Anlik.fromJson(Map json) {
    this.sicaklik = json['temp'];
    //int mi değil mi, ona göre yazım kontrolü alttaki gibi yapılabilir
    //  this.sicaklik=(json['temp'] is int)? json['temp'] : int.tryParse(json['temp']);
    // kesin double olarak gelmesini istiyosan bu verinin alttakini yap:
    // int.tryParse('${json['temp']}');
    this.zaman = json['dt'];
    this.hava = (json['weather'] ?? [])
        .map((eleman) => Hava.fromJson(eleman))
        .toList()
        .cast<Hava>();
  }
}
