import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          backgroundColor: Colors.white,
          title: Text(
            "Product Detail",
            style: TextStyle(color: Colors.green),
          )),
      body: _buildProductsDetails(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
          );
        }
      
        _buildProductsDetails(BuildContext context) {
          Size size = MediaQuery.of(context).size;
          return ListView(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildProductImages(),
                      _buildProductTitle(),
                      SizedBox(
                        height: 12.0,
                      ),
                      _buildProductPrice(),
                      SizedBox(
                        height: 12.0,
                      ),
                      _buildDivider(size),
                      SizedBox(
                        height: 12.0,
                      ),
                      _buildFurtherInfo(),
                      SizedBox(
                        height: 12.0,
                      ),
                      _buildDivider(size),
                      SizedBox(
                        height: 12.0,
                      ),
                      _buildSizeArea(),
                      SizedBox(
                        height: 12.0,
                      ),
                      _buildInfo(),
                    ],
                  ))
            ],
          );
        }
      
        _buildProductImages() {
          TabController imagesController = TabController(length: 3, vsync: this);
          return Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                height: 250.0,
                child: Center(
                  child: DefaultTabController(
                      length: 3,
                      child: Stack(
                        children: <Widget>[
                          TabBarView(
                            controller: imagesController,
                            children: <Widget>[
                              Image.network(
                                  "https://images-na.ssl-images-amazon.com/images/I/81TUZ566XEL._AC_UY550_.jpg"),
                              Image.network(
                                  "https://images-na.ssl-images-amazon.com/images/I/81TUZ566XEL._AC_UY550_.jpg"),
                              Image.network(
                                  "https://images-na.ssl-images-amazon.com/images/I/81TUZ566XEL._AC_UY550_.jpg"),
                            ],
                          ),
                          Container(
                            alignment: FractionalOffset(0.5, 1.0),
                            child: TabPageSelector(
                                controller: imagesController,
                                selectedColor: Colors.blue[100],
                                color: Colors.white),
                          )
                        ],
                      )),
                ),
              ));
        }
      
        _buildProductTitle() {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Center(
              child: Text(
                "Jack - Jones T-Shirt",
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
            ),
          );
        }
      
        _buildProductPrice() {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: <Widget>[
                Text(
                  "\$ 100",
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  "\$ 300",
                  style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.red,
                      decoration: TextDecoration.lineThrough),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  "\½50 indirim",
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.blue,
                      decoration: TextDecoration.lineThrough),
                ),
                SizedBox(
                  width: 8.0,
                )
              ],
            ),
          );
        }
      
        _buildDivider(Size screenSize) {
          return Column(
            children: <Widget>[
              Container(
                color: Colors.grey,
                width: screenSize.width,
                height: 0.25,
              )
            ],
          );
        }
      
        _buildFurtherInfo() {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.local_mall),
                SizedBox(
                  width: 12.0,
                ),
                Text(
                  "Daha Fazla Bilgi İçin Tıklayınız",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }
      
        _buildSizeArea() {
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.straighten, color: Colors.grey),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        "Beden: M",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Beden Tablosu",
                          style: TextStyle(fontSize: 12.0, color: Colors.blue))
                    ],
                  )
                ],
              ));
        }
      
        _buildInfo() {
          TabController tabController = TabController(length: 2, vsync: this);
          return Container(
            child: Column(
              children: <Widget>[
                TabBar(
                  controller: tabController,
                   tabs: <Widget>[
                  Tab(
                    child: Text(
                      "Ürün Bilgisi",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Yıkama gisi",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  height: 30.0,
                  child: TabBarView(
                    controller: tabController,
                    children: <Widget>[
                      
                      Text("%60 pamuk, %30 Polyrster",
                       style: TextStyle(color: Colors.black, height: 2.5),),
                      
                      Text("30 Derece makina da renkli yıkama",
                       style: TextStyle(color: Colors.black, height: 2.5,),),
      
                    ],
                  ),
                )
              ],
            ),
          );
        }
      
        _buildBottomNavigationBar() {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 50.0,

              child:Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: RaisedButton(
                      onPressed: (){},
                      color: Colors.grey,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.list, color: Colors.white,),
                          SizedBox(width: 4.0,),
                          Text("İstek", style: TextStyle(color: Colors.white),)
                        ],
                      ),
                      ),
                    ),
                     Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: RaisedButton(
                      onPressed: (){},
                      color: Colors.greenAccent,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.list, color: Colors.white,),
                          SizedBox(width: 4.0,),
                          Text("Sepete Ekle", style: TextStyle(color: Colors.white),)
                        ],
                      ),
                      ),
                    ),
                ],
              )
            );



        }
}
