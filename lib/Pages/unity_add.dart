import 'package:app_jam_deneme_1/profile_unity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../service/status_service.dart';
import 'name_surname.dart';

class UnityAddPage extends StatefulWidget {
  const UnityAddPage({Key? key}) : super(key: key);

  @override
  State<UnityAddPage> createState() => _UnityAddPageState();
}

class _UnityAddPageState extends State<UnityAddPage> {
  TextEditingController projeAlanController = TextEditingController();
  TextEditingController ekipSayisiController = TextEditingController();
  TextEditingController projeDetayController = TextEditingController();
  StatusService _statusService = StatusService();

  String? selectedValue;
  List<String> dropdownItems = ['1-2', '2-3', '3-4', '4-5', '5-6'];

  String adSoyad = '';
  @override
  void initState() {
    super.initState();
    getAdSoyad();
  }

  void getAdSoyad() async {
    String result = await getAdSoyadFromFirestore();
    setState(() {
      adSoyad = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: Text("Proje Ekle"),
        ),
        body: Container(
          color: Colors.purple.shade300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Opacity(
                    opacity: 0.8,
                    child: Image(image: AssetImage("assets/indirrr.png"))),
              ),
              SizedBox(height: 10),
              Text(
                "Hoşgeldin $adSoyad",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Alan Seçiniz:   ',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        child: TextField(
                      style: TextStyle(fontSize: 20),
                      controller: projeAlanController,
                    )),
                  ],
                ),
              ),
              Container(
                width: 350,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ekip Sayısı:      ',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: DropdownButton(
                        hint: Text("Seçiniz"),
                        value: selectedValue,
                        items: dropdownItems.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 24),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                            //saveSelectedValue(selectedValue!);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 350,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Proje Detayı:    ',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Container(
                        height: 300,
                        child: SingleChildScrollView(
                          child: TextField(
                            style: TextStyle(fontSize: 20),
                            controller: projeDetayController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 25),
                child: InkWell(
                  onTap: () {
                    _statusService
                        .addStatus(projeAlanController.text, selectedValue!,
                            projeDetayController.text ?? '')
                        .then((value) {
                      Fluttertoast.showToast(
                          msg: "Proje eklendi!",
                          timeInSecForIosWeb: 2,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.grey[600],
                          textColor: Colors.white,
                          fontSize: 14);
                    });

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UProfilim()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        //color: colorPrimaryShade,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        "Ekle",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      )),
                    ),
                  ),
                ),
              ),
              Container(
                child: Opacity(
                    opacity: 0.8,
                    child: Image(image: AssetImage("assets/indirrr.png"))),
              ),
            ],
          ),
        ));
  }
}
