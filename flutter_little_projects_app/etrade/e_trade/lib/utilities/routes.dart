import 'package:e_trade/screens/productDetail.dart';
import 'package:e_trade/utilities/constans.dart';
import 'package:flutter/material.dart';


class Routes{
  static final routes = <String,WidgetBuilder>{
   Constants.ROUTE_PRODUCT_DETAIL:(BuildContext contex) => ProductDetail()
  };
}