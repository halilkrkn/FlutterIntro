import 'package:drawer/screens/customer_screen.dart';
import 'package:drawer/screens/home.dart';
import 'package:drawer/screens/product_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.deepOrange,
      ),
      home: Home(),
      // yolları belirterek istenilen durumun çalışması
      routes: <String,WidgetBuilder>{
        CustomerScreen.routeName:(BuildContext context) => new CustomerScreen(),
        ProductScreen.routeName:(BuildContext context) => new ProductScreen(),
      
      },
    );
  }
}

