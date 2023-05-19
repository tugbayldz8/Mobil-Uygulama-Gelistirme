class Hava {
  int? kimlikNo;
  String? olay;
  String? ikon;

  Hava.fromJson(Map json) {
    this.kimlikNo = json['id'];
    this.olay = json['description'];
    this.ikon = json['icon'];
  }
}
