import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
      FirstApp()
  );
}


class FirstApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
        title: "My First App",
        color: Colors.green,
        home: Scaffold(
          appBar: AppBar(
            title: Text("App Bar Title"),
            backgroundColor: Colors.deepPurple,
          ),
          body: MainPage(),
        ));
  }

}

class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return    Material(
              color: Colors.orange,
              child: Center(
                //Widget
                child: Text(
                  "Merhaba Dünya, " + SelamVer(),
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.black, 
                  fontSize: 35.0
                  ),
                ),
              ));
  }

}

String SelamVer(){

  DateTime now = new DateTime.now();

  int hour = now.hour;
  if(hour < 12){
    return "Günaydınn";
  }
  else {
    return "İyi Akşamlar";
  }

  
}