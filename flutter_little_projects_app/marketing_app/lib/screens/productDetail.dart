import 'package:flutter/material.dart';
import 'package:marketing_app/db/dbHelper.dart';
import 'package:marketing_app/models/product.dart';

class ProductDetail extends StatefulWidget {
  
  Product product;
  ProductDetail(this.product);

  @override
  State<StatefulWidget> createState() => ProductDetailState(product);
}

DbHelper dbHelper = DbHelper();
enum Choice { Delete, Update }

class ProductDetailState extends State {
  Product product;
  ProductDetailState(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Product Detail for ${product.name}"),
          actions: <Widget>[
            PopupMenuButton<Choice>(
              onSelected: select,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Choice>>[
                PopupMenuItem<Choice>(
                  value: Choice.Delete,
                  child: Text("Delete Product"),
                ),
                PopupMenuItem<Choice>(
                  value: Choice.Update,
                  child: Text("Update Product"),
                ),
              ],
            )
          ],
        ),
        body: Center(
          child: Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text(product.name),
                  subtitle: Text(product.description),
                ),
                Text("${product.name} price is: ${product.price}"),
                ButtonTheme(
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                          onPressed: () {
                            AlertDialog alertDialog = AlertDialog(
                              title: Text("Success"),
                              content: Text("${product.name} added to card!!"),
                            );
                            showDialog(
                                context: context, builder: (_) => alertDialog);
                          },
                          child: Text("Add to Card"))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void select(Choice choice) async {
    int result;
    switch (choice) {
      case Choice.Delete:
        Navigator.pop(context, true);
        result = await dbHelper.delete(product);
        if (result != 0) {
          AlertDialog alertDialog = AlertDialog(
            title: Text("Success"),
            content: Text("Deleted Product: ${product.name}"),
          );
          showDialog(context: context, builder: (_) => alertDialog);
        }
        break;
      default:
    }
  }
}
