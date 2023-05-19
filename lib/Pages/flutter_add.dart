import 'package:app_jam_deneme_1/home_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../service/status_service.dart';

class FlutterAddPage extends StatefulWidget {
  const FlutterAddPage({Key? key}) : super(key: key);

  @override
  State<FlutterAddPage> createState() => _FlutterAddPageState();
}

class _FlutterAddPageState extends State<FlutterAddPage> {
  TextEditingController projeAlanController = TextEditingController();
  TextEditingController ekipSayisiController = TextEditingController();
  TextEditingController projeDetayController = TextEditingController();
  StatusService _statusService = StatusService();

  String? selectedValue;
  List<String> dropdownItems = ['1-2', '2-3', '3-4', '4-5', '5-6'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: Text("Proje Ekle"),
        ),
        body: Container(
          color: Colors.greenAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Opacity(
                    opacity: 0.8,
                    child: Image(image: AssetImage("assets/indir.png"))),
              ),
              SizedBox(height: 10),
              Text(
                "Hoşgeldin Tuğba :)",
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
                      // Container(
                      //   height: 300,
                      //   child: SingleChildScrollView(
                      //     child: TextField(
                      //       style: TextStyle(fontSize: 20),
                      //       controller: ekipSayisiController,
                      //       keyboardType: TextInputType.number,
                      //       maxLines: null,
                      //     ),
                      //   ),
                      // ),
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
                        .addStatus(
                            projeAlanController.text,
                            selectedValue!,
                            //ekipSayisiController.text,
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
                        MaterialPageRoute(builder: (context) => Draw()));
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
                    child: Image(image: AssetImage("assets/indir.png"))),
              ),
            ],
          ),
        ));
  }
}
