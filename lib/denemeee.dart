import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyDropdownList extends StatefulWidget {
  @override
  _MyDropdownListState createState() => _MyDropdownListState();
}

class _MyDropdownListState extends State<MyDropdownList> {
  String? selectedValue;
  List<String> dropdownItems = ['Değer 1', 'Değer 2', 'Değer 3'];

  void saveSelectedValue(String selectedValue) {
    FirebaseFirestore.instance
        .collection('secilen_veriler')
        .doc('kayit_1')
        .set({'secilen_deger': selectedValue});
  }

  Future<String> fetchSelectedValue() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('secilen_veriler')
        .doc('kayit_1')
        .get();

    if (snapshot.exists) {
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
      if (data != null) {
        String selectedValue = data['secilen_deger'];
        return selectedValue;
      }
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Liste'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              value: selectedValue,
              items: dropdownItems.map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue!;
                  saveSelectedValue(selectedValue!);
                });
              },
            ),
            SizedBox(height: 16),
            FutureBuilder<String>(
              future: fetchSelectedValue(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  String selectedValue = snapshot.data!;
                  return Text('Seçilen değer: $selectedValue');
                } else {
                  return Text('Veri bulunamadı.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
