import 'package:anket_firebase/screen/anketList.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Anket"),
        ),
        body: AnketList(),
      ),
    );
  }
}

final dummySnapshot = [
  {"isim": "C#", "oy": 3},
  {"isim": "Perl", "oy": 4},
  {"isim": "Python", "oy": 1},
  {"isim": "C++", "oy": 6},
  {"isim": "Java", "oy": 7},
];
