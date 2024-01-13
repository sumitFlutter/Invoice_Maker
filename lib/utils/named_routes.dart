import 'package:flutter/cupertino.dart';
import 'package:invoice_maker/screen/home/home_screen.dart';
import 'package:invoice_maker/screen/splesh/splesh_screen.dart';

Map<String,WidgetBuilder> routes={
  "/":(context) =>SpleshScreen(),
  "home":(context) => HomeScreen(),
};