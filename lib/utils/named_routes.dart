import 'package:flutter/cupertino.dart';
import 'package:invoice_maker/screen/home/home_screen.dart';
import 'package:invoice_maker/screen/invoice/invoice_view_screen.dart';
import 'package:invoice_maker/screen/splesh/splesh_screen.dart';
import 'package:invoice_maker/screen/user_input/user_input_screen.dart';

Map<String,WidgetBuilder> routes={
  "/":(context) =>const SpleshScreen(),
  "home":(context) => const HomeScreen(),
  "getter":(context) => const DetailGetter(),
  "invoice":(context) => const InvoiceView(),
};