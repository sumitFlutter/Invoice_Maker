import 'package:flutter/cupertino.dart';

Map personaldetails={
  "name":"",
  "email":"",
  "mobile":"",
  "address":"",
  "image":"assets/image/0.png"
};
List<Map> productList=[
  {
    "name":"","price":1,"image":"assets/image/0.png","net_q":1,"brand":"","nameText":TextEditingController(),"priceText":TextEditingController(),"nText":TextEditingController(),"dateText":TextEditingController(),"date":"",
  }
];
int total=0;
int with_GST=0;
void count()
{
  for(int i=0;i<productList.length;i++)
  {
    total=total+((productList[i]["price"]*productList[i]["net_q"])as int);
  }
  with_GST=total+(total*18~/100);
}
