import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoice_maker/utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String gv="";
  String? path;
  int index=0;
  GlobalKey<FormState> key=GlobalKey<FormState>();
  TextEditingController nametxt = TextEditingController();
  TextEditingController emailtxt=TextEditingController();
  TextEditingController mobiletxt=TextEditingController();
  TextEditingController addresstxt=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Welcome To My App",style: TextStyle(color: Colors.white60,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: IndexedStack(
          index:index,
          children: [
            getPersonalDetails(),
            product(),
          ],
        ),
      ),
    ));
  }

  Widget getPersonalDetails() {
    return Container(
      margin: EdgeInsets.all(10),
     color: Colors.black54,
      child: Form(
        key: key,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                const Text("Enter Your Personal Details Here:",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,decorationColor: Colors.white,decorationThickness: 2,decorationStyle: TextDecorationStyle.wavy),),
              Align(
              alignment: Alignment.topCenter,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                height: MediaQuery.sizeOf(context).height * 0.30,
                width: MediaQuery.sizeOf(context).width * 0.85,
                color: Colors.black54,
                child:  Stack(
                  alignment: Alignment.center,
                  children: [
                    path==null?
                    const CircleAvatar(
                      radius: 90,
                    ): CircleAvatar(
                      radius: 90,
                      backgroundImage: FileImage(File(path!)),
                    ),
                    Align(
                        alignment: const Alignment(0.5, 0.5),
                        child: IconButton(
                          onPressed: () async{
                           ImagePicker picker=ImagePicker();
                            XFile? image = await picker.pickImage(source: ImageSource.camera);
                            setState(() {
                              path=image!.path;
                            });

                          },
                          icon: const Icon(
                            Icons.add_a_photo_rounded,
                            color: Colors.black,
                            weight: 50,
                          ),
                        ))
                  ],
                ),
              ),
            ),
                const SizedBox(height: 15,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Enter your name:",style: TextStyle(fontSize: 18,color: Colors.white60,fontWeight: FontWeight.bold),),
                      SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.45,
                          child: TextFormField(
                            validator: (value) {
                              if(value!.isEmpty)
                              {
                                return "Enter your name";
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            style: const TextStyle(color: Colors.white),
                            controller: nametxt,
                            decoration: const InputDecoration(
                              hintText: "Surname Name ",
                                hintStyle: TextStyle(color: Colors.white60,fontWeight: FontWeight.bold),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(strokeAlign: 2,color: Colors.white60))),
                          )),
                    ]
                ),
                const SizedBox(height: 15,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Enter your email Address:",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white60),),
                      SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.45,
                          child: TextFormField(
                            validator: (value) {
                              if(value!.isEmpty)
                              {
                                return "Enter your email";
                              }
                              else if (!RegExp(
                              "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$")
                                  .hasMatch(value!)) {
                              return "enter the valid email";
                              }
                              return null;
                            },
                            style: const TextStyle(color: Colors.white),
                            textInputAction: TextInputAction.next,
                            controller: emailtxt,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: "name@gmail.com",
                                hintStyle: TextStyle(color: Colors.white60,fontWeight: FontWeight.bold),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(strokeAlign: 2,color: Colors.white60))),
                          )),
                    ]

                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Enter your Mobile Number:",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white60),),
                    SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.45,
                        child: TextFormField(
                          validator: (value) {
                            if(value!.isEmpty)
                            {
                              return "Enter your number";
                            }
                            else if ((value!.length != 10)) {
                              return "enter the valid number";
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.done,
                          controller: mobiletxt,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: "1234567890",
                              hintStyle: TextStyle(color: Colors.white60,fontWeight: FontWeight.bold),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(strokeAlign: 2,color: Colors.white60))),
                        )),

                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Enter your Address:",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white60),),
                      SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.45,
                          child: TextFormField(
                            validator: (value) {
                              if(value!.isEmpty)
                                {
                                  return "Enter your address";
                                }
                              return null;
                            },
                            style: const TextStyle(color: Colors.white),
                            textInputAction: TextInputAction.next,
                            controller: addresstxt,
                            decoration: const InputDecoration(
                                hintText: "surat",
                                hintStyle: TextStyle(color: Colors.white60,fontWeight: FontWeight.bold),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(strokeAlign: 2,color: Colors.white60))),
                          )),
                    ]

                ),
                const SizedBox(height: 15,),
                ElevatedButton(onPressed: () {
                      if (key.currentState!.validate())
                        {
                          personaldetails.add({"name":nametxt.text});
                          personaldetails.add({"email":emailtxt.text});
                          personaldetails.add({"mobile":mobiletxt.text});
                          personaldetails.add({"address":addresstxt.text});
                          personaldetails.add({"image":path});
                          setState(() {
                            index=1;
                          });
                          print(personaldetails);
                        }
                }, child: const Text("Submit",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
              ],
            )

          ],
        ),
      ),
    );
  }
  Widget product()
  {
    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Enter your product details\n(that you bought):",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
        Column(
          children: List.generate(productList.length, (index) => Column(
            children: [
              Row(
                children: [
                  Container(margin: EdgeInsets.all(25),
                    height: 120,width: 120,child: Image.asset("${productList[index]["image"]}",fit: BoxFit.fill),),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Text("Enter product name:",style: TextStyle(color: Colors.white,fontSize: 15),),
                          SizedBox(height:60,width:60,child: TextFormField(
                            keyboardType: TextInputType.name,
                            controller: productList[index]["nameText"],
                            style: const TextStyle(color: Colors.white),
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Enter product's price:",style: TextStyle(color: Colors.white,fontSize: 15),),
                          SizedBox(height:60,width:60,child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: productList[index]["priceText"],
                            style: const TextStyle(color: Colors.white),
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Enter product's price:",style: TextStyle(color: Colors.white,fontSize: 15),),
                          SizedBox(height:60,width:60,child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: productList[index]["nText"],
                            style: const TextStyle(color: Colors.white),
                          )),
                        ],
                      ),
                    ],
                  ),


                ],
              ),
              const Text("Please Select Product's Brand:",style: TextStyle(fontSize:18,color: Colors.white),),
              Row(
                children: [
                  Radio(activeColor:Colors.blue,value: "samsung", groupValue: gv, onChanged: (value) {
                   setState(() {
                     gv=value!;
                     if(gv=="samsung")
                       {
                         productList[index]["image"]="assets/image/1.jpeg";
                       }
                   });
                  },),
                  Text("Samsung",style: TextStyle(color: Colors.white),),
                  Radio(activeColor:Colors.blue,value: "apple", groupValue: gv, onChanged: (value) {
                    setState(() {
                      gv=value!;
                      if(gv=="apple")
                      {
                        productList[index]["image"]="assets/image/2.png";
                      }
                    });
                  },),
                  Text("Apple",style: TextStyle(color: Colors.white),),
                  Radio(activeColor:Colors.blue,value: "vivo", groupValue: gv, onChanged: (value) {
                    setState(() {
                      gv=value!;
                      if(gv=="vivo")
                      {
                        productList[index]["image"]="assets/image/3.png";
                      }
                    });
                  },),
                  Text("Vivo",style: TextStyle(color: Colors.white),),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Radio(activeColor:Colors.blue,value: "oppo", groupValue: gv, onChanged: (value) {
                        setState(() {
                          gv=value!;
                          if(gv=="oppo")
                          {
                            productList[index]["image"]="assets/image/4.png";
                          }
                        });
                      },),
                      Text("Oppo",style: TextStyle(color: Colors.white),),
                      Radio(activeColor:Colors.blue,value: "Nokia", groupValue: gv, onChanged: (value) {
                        setState(() {
                          gv=value!;
                          if(gv=="Nokia")
                          {
                            productList[index]["image"]="assets/image/5.png";
                          }
                        });
                      },),
                      Text("Nokia",style: TextStyle(color: Colors.white),),


                    ],
                  ),
                ],
              ),


            ],
          ))
        ),
        ElevatedButton(onPressed: () {
          setState(() {
  productList.add({
    "name":"","price":0,"image":"assets/image/0.png","net_q":0,"brand":"","nameText":TextEditingController(),"priceText":TextEditingController(),"nText":TextEditingController(),
          });
          });

        }, child: Text("+ Add Products")),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: () {
          setState(() {
            for(int i=0;i<productList.length;i++)
              {
                productList[i]["brand"]=gv;
                productList[i]["name"]=productList[i]["nameText"].text;
                productList[i]["price"]=int.parse("${productList[i]["priceText"].text}");
                print(productList);
              }
          });
        }, child: const Text("Submit"))
      ],
    );
  }
}
