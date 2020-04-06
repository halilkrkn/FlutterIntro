import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsappbro/home.dart';

List<CameraDescription> camera;

Future<Null> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  camera = await availableCameras();
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsappBro',
      theme: ThemeData(
        primaryColor:Colors.orange,
        accentColor: Colors.blueAccent
      ),
      home: Home(camera:camera),
    );
  }
}

