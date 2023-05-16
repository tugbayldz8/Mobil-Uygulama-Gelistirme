import 'dart:math';

import 'package:app_jam_deneme_1/newDraw.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Con(),
    );
  }
}

class Con extends StatefulWidget {
  const Con({Key? key}) : super(key: key);

  @override
  State<Con> createState() => _ConState();
}

class _ConState extends State<Con> {
  List<Contact> contacts = [];

  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContactPermission();
  }

  void getContactPermission() async {
    if (await Permission.contacts.isGranted) {
      fetchContacts();
    } else {
      await Permission.contacts.request();
    }
  }

  void fetchContacts() async {
    contacts = await ContactsService.getContacts();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NewDraw(),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: Text("Kişiler"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    width: 70,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7,
                          color: Colors.white.withOpacity(0.1),
                          offset: const Offset(-3, -3),
                        ),
                        BoxShadow(
                          blurRadius: 7,
                          color: Colors.black.withOpacity(0.7),
                          offset: const Offset(3, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xff262626),
                    ),
                    child: Text(
                      contacts[index].givenName![0],
                      style: TextStyle(
                        color: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  title: Text(
                    contacts[index].givenName!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(contacts[index].phones![0].value!),
                  horizontalTitleGap: 12,
                );
              },
            ),
    );
  }
}
