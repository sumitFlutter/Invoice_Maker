import 'dart:io';

import 'package:flutter/material.dart';
import 'package:invoice_maker/utils/global.dart';
import 'package:invoice_maker/utils/widgets/pdf.dart';
class InvoiceView extends StatefulWidget {
  const InvoiceView({super.key});

  @override
  State<InvoiceView> createState() => _InvoiceViewState();
}

class _InvoiceViewState extends State<InvoiceView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: MediaQuery.sizeOf(context).width,
                  color: Colors.black,
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    children: [
                      personaldetails["image"]=="assets/image/0.png"?const CircleAvatar(radius: 60,):
                      CircleAvatar(radius: 60,
                      backgroundImage: FileImage(File("${personaldetails["image"]}")),),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(personaldetails["name"],style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                          Text(personaldetails["email"],style: const TextStyle(color: Colors.white,fontSize: 15),),
                          Text(personaldetails["mobile"],style: const TextStyle(color: Colors.white,fontSize: 15),),
                          Text(personaldetails["address"],style: const TextStyle(color: Colors.white,fontSize: 15),),
                          Text("Total price is \$$total",style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                          const Text("+ GST 18%",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                          Text("Net price is \$$with_GST",style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),


                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  children: List.generate(productList.length, (index) => Container(margin: const EdgeInsets.all(25),child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("${productList[index]["image"]}",height: 100,width: 100,fit: BoxFit.fill,),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Name=${productList[index]["name"]}\n",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          Text("Price=\$${productList[index]["price"]}\n",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                          Text("Net Quantity=${productList[index]["net_q"]}\n",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                          Text("Date=${productList[index]["date"]}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                        ],
                      ),
                    ],
                  ),
                  ),
                  ),
                )
              ],
            ),
          ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          createPDF();
        });

      },
      child: Icon(Icons.save)),
    ),
    );
  }
}
