


import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsappbro/screens/calls_screens.dart';
import 'package:whatsappbro/screens/camera_screen.dart';
import 'package:whatsappbro/screens/chat_screen.dart';
import 'package:whatsappbro/screens/status_screen.dart';

import 'main.dart';

class Home extends StatefulWidget {

  final List<CameraDescription> camera;
  Home({this.camera});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State  with SingleTickerProviderStateMixin{
  TabController _tapController;

@override
  void initState() {
    //Uygulama başladığında çalışan ilk blok
    super.initState();
    _tapController = TabController(length: 4  , initialIndex: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("WhatsappBro"),
         bottom: TabBar(
           controller: _tapController,
           indicatorColor: Colors.purpleAccent,
           tabs:<Widget>[
             Tab(text:"Kamera", icon: Icon(Icons.camera)),
             Tab(text: "Sohbetler", icon: Icon(Icons.chat)),
             Tab(text: "Durum", icon: Icon(Icons.local_activity)),
             Tab(text: "Aramalar ", icon: Icon(Icons.call))
             
           ],
           ),
           actions: <Widget>[
             Icon(Icons.search),
             Icon(Icons.more_vert),
           ],
       ),
       body: TabBarView(
         controller: _tapController,
         children: <Widget>[
           CameraScreen(camera),
           ChatScreen(),
           StatusScreen(),
           CallScreen(),

         ],
       ),
       floatingActionButton: FloatingActionButton(
         
         backgroundColor: Theme.of(context).accentColor,
         child: Icon(
           Icons.message,
          color: Colors.black,
         ),
         onPressed:()=>print("Sohbet Ekranı"),
         ),
          
    );
  }
}