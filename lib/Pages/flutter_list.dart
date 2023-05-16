import 'package:app_jam_deneme_1/Pages/video_page.dart';
import 'package:app_jam_deneme_1/service/status_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../newDraw.dart';
import 'notification.dart';

class FlutterListPage extends StatefulWidget {
  const FlutterListPage({Key? key}) : super(key: key);

  @override
  State<FlutterListPage> createState() => _FlutterListPageState();
}

class _FlutterListPageState extends State<FlutterListPage> {
  StatusService _statusService = StatusService();
  ScrollController _scrollController = ScrollController();
  List<Color> color = [
    Colors.yellow,
    Colors.teal,
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.grey,
    Colors.teal,
    Colors.brown,
  ];

  final _service = FirebaseNotificationService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _service.connectNotgication();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
      stream: _statusService.getStatus(),
      builder: (context, snaphot) {
        return !snaphot.hasData
            ? CircularProgressIndicator()
            : Scaffold(
                drawer: NewDraw(),
                appBar: AppBar(
                  backgroundColor: Colors.grey.shade900,
                  title: Text('Projeler'),
                ),
                body: Scrollbar(
                  thickness: 10,
                  controller: _scrollController,
                  child: ListView.builder(
                      itemCount: snaphot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot mypost = snaphot.data!.docs[index];

                        //veri silmek için
                        Future<void> _showChoiseDialog(BuildContext context) {
                          return showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    title: Text(
                                      "Silmek istediğinize emin misiniz?",
                                      textAlign: TextAlign.center,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0))),
                                    content: Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () {
                                                _statusService
                                                    .removeStatus(mypost.id);
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Evet",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Vazgeç",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        )));
                              });
                        }

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              _showChoiseDialog(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 305,
                                decoration: BoxDecoration(
                                    color: //Random().nextInt(color.length)
                                        color[index],
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Proje Alanı:\t',
                                                style: TextStyle(
                                                    color: Colors.red.shade900,
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "${mypost['alan']}",
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                            ]),
                                        SizedBox(height: 5),
                                        Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Ekip Sayısı:\t',
                                                style: TextStyle(
                                                    color: Colors.red.shade900,
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "${mypost['ekipSayisi']}",
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                            ]),
                                        SizedBox(height: 5),
                                        Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Proje Detayı:\t',
                                                style: TextStyle(
                                                    color: Colors.red.shade900,
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Container(
                                                width: 200,
                                                child: Text(
                                                  "${mypost['projeDetay']}",
                                                  maxLines: null,
                                                  overflow: TextOverflow.clip,
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ]),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            VideoPage()));
                                              },
                                              child: Text("TANITIM İZLE"),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Projeye Katılma İsteğiniz Kullanıcıya İletildi!'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text('Tamam'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              child: Text("KATIL"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              );
      },
    );
  }
}
