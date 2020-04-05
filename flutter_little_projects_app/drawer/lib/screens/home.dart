import 'package:drawer/screens/customer_screen.dart';
import 'package:drawer/screens/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
      ),
      body: Container(
        child: Center(
          child: Text("Anasayfa",textAlign: TextAlign.justify),
        
        ),
      ),
      drawer: buildDrawer(context),
    );
  }

  Drawer createMenuItems(BuildContext context) {

    createNavigationItem(var icon, String page, String routeName) {
      return ListTile(
        leading: Icon(icon),
        title: Text(page),
        onTap: () {
          setState(() {
            //Çekmeceyi kapatıyor
            Navigator.of(context).pop();
            //Çekmeceyi açıp içindekilerin yolunu belirttik
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var navigationList = [
      createNavigationItem(
          Icons.supervisor_account, "Customers", CustomerScreen.routeName),
      createNavigationItem(
          Icons.shopping_basket, "Products", ProductScreen.routeName),
      createNavigationItem(Icons.home, "Home", "/"),
    ];
    ListView menuItems = ListView(
      children: navigationList,
    );
    return Drawer(child: menuItems,);
  }

  buildDrawer(BuildContext context) {
    return Drawer(
      child: createMenuItems(context),
    );
    
  }
}
