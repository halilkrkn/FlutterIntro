import 'package:marketing_app/db/dbHelper.dart';
import 'package:marketing_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:marketing_app/screens/productAdd.dart';
import 'package:marketing_app/screens/productDetail.dart';

class ProductList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductListState();
}

class ProductListState extends State {
  DbHelper dbHelper = DbHelper();
  List<Product> products;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    if (products == null) {
      products = List<
          Product>(); // new lemeye gerek yok bu şekilde de aynı kullanım oluyor.
      getData();
    }

    return Scaffold(
      body: ProductListItems(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToProductAdd();
        },
        tooltip: "add new product",
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }

  ListView ProductListItems() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.amberAccent,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: Text("A"),
            ),
            title: Text(this.products[position].name),
            subtitle: Text(this.products[position].description),
            onTap: () {
              goToDetail(this.products[position]);
            },
          ),
        );
      },
    );
  }

  //Verileri Çekme operasyonu
  void getData() {
    var dbFuture = dbHelper.initializeDb();

    dbFuture.then((result) {
      var productsFuture = dbHelper.getProducts();
      productsFuture.then((data) {
        List<Product> productsData = List<Product>();
        count = data.length;
        for (var i = 0; i < count; i++) {
          productsData.add(Product.fromObject([i]));
        }
        setState(() {
          products = productsData;
          count = count;
        });
      });
    });
  }

  void goToDetail(Product product) async {
    bool result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProductDetail(product)));
    if (result != null) {
      if (result) {
        getData();
      }
    }
  }

  void goToProductAdd() async {
    bool result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProductAdd()));
    if (result != null) {
      if (result) {
        getData();
      }
    }
  }
}
