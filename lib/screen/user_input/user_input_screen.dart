import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoice_maker/utils/global.dart';
class DetailGetter extends StatefulWidget {
  const DetailGetter({super.key});

  @override
  State<DetailGetter> createState() => _DetailGetterState();
}

class _DetailGetterState extends State<DetailGetter> {
  String? path="assets/image/0.png";
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
              title: const Text("Enter Your Details here",style: TextStyle(color: Colors.white60,fontWeight: FontWeight.bold),),
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
            floatingActionButton: FloatingActionButton(onPressed: () => Navigator.pushNamed(context, "invoice"),child: const Icon(Icons.receipt),)
        ));
  }

  Widget getPersonalDetails() {
    return Container(
      margin: const EdgeInsets.all(10),
      color: Colors.black54,
      child: Form(
        key: key,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
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
                        path=="assets/image/0.png"?
                        const CircleAvatar(
                          radius: 70,
                        ): CircleAvatar(
                          radius: 70,
                          backgroundImage: FileImage(File(path!)),
                        ),
                        Align(
                            alignment: const Alignment(0.35, 0.35),
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
                      const Text("Enter your name:",style: TextStyle(color: Colors.white60,fontWeight: FontWeight.bold),),
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
                            style: const TextStyle(color: Colors.white),
                            textInputAction: TextInputAction.next,
                            controller: nametxt,
                            decoration: const InputDecoration(
                                hintText: "Surname Name ",
                                hintStyle: TextStyle(color: Colors.white30,fontWeight: FontWeight.bold),
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
                                  .hasMatch(value)) {
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
                                hintStyle: TextStyle(color: Colors.white30,fontWeight: FontWeight.bold),
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
                            else if ((value.length != 10)) {
                              return "enter the valid number";
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          controller: mobiletxt,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              hintText: "1234567890",
                              hintStyle: TextStyle(color: Colors.white30,fontWeight: FontWeight.bold),
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
                            controller: addresstxt,
                            decoration: const InputDecoration(
                                hintText: "surat",
                                hintStyle: TextStyle(color: Colors.white30,fontWeight: FontWeight.bold),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(strokeAlign: 2,color: Colors.white60))),
                          )),
                    ]

                ),
                const SizedBox(height: 15,),
                ElevatedButton(onPressed: () {
                  if (key.currentState!.validate())
                  {
                    personaldetails["name"]=nametxt.text;
                    personaldetails["address"]=addresstxt.text;
                    personaldetails["mobile"]=mobiletxt.text;
                    personaldetails["email"]=emailtxt.text;
                    personaldetails["image"]=path;
                    setState(() {
                      index=1;
                    });
                  }
                }, child: const Text("Next",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
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
        Column(
            children: List.generate(productList.length, (index) => Column(
              children: [
                Row(
                  children: [
                    Container(margin: const EdgeInsets.only(left: 15,bottom: 25,right: 15,top: 25),
                      height: 120,width: 120,child: Image.asset("${productList[index]["image"]}",fit: BoxFit.fill),),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text("Enter product name:",style: TextStyle(color: Colors.white,fontSize: 15),),
                            SizedBox(height:60,width:60,child: TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              controller: productList[index]["nameText"],
                              style: const TextStyle(color: Colors.white),
                            )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text("Enter product's price:",style: TextStyle(color: Colors.white,fontSize: 15),),
                            SizedBox(height:60,width:60,child: TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              controller: productList[index]["priceText"],
                              style: const TextStyle(color: Colors.white),
                            )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text("Enter Quantity:",style: TextStyle(color: Colors.white,fontSize: 15),),
                            SizedBox(height:60,width:60,child: TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              controller: productList[index]["nText"],
                              style: const TextStyle(color: Colors.white),
                            )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text("Enter Purchase Date:",style: TextStyle(color: Colors.white,fontSize: 15),),
                            SizedBox(height:60,width:60,child: TextFormField(
                              keyboardType: TextInputType.datetime,
                              controller: productList[index]["dateText"],
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
                    Radio(activeColor:Colors.blue,value: "samsung", groupValue:productList[index]["brand"], onChanged: (value) {
                      setState(() {productList[index]["brand"]=value!;
                      if(productList[index]["brand"]=="samsung")
                      {
                        productList[index]["image"]="assets/image/1.jpeg";
                      }
                      });
                    },),
                    const Text("Samsung",style: TextStyle(color: Colors.white),),
                    Radio(activeColor:Colors.blue,value: "apple", groupValue: productList[index]["brand"], onChanged: (value) {
                      setState(() {
                        productList[index]["brand"]=value!;
                        if( productList[index]["brand"]=="apple")
                        {
                          productList[index]["image"]="assets/image/2.png";
                        }
                      });
                    },),
                    const Text("Apple",style: TextStyle(color: Colors.white),),
                    Radio(activeColor:Colors.blue,value: "vivo", groupValue: productList[index]["brand"], onChanged: (value) {
                      setState(() {
                        productList[index]["brand"]=value!;
                        if(productList[index]["brand"]=="vivo")
                        {
                          productList[index]["image"]="assets/image/3.png";
                        }
                      });
                    },),
                    const Text("Vivo",style: TextStyle(color: Colors.white),),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Radio(activeColor:Colors.blue,value: "oppo", groupValue: productList[index]["brand"], onChanged: (value) {
                          setState(() {
                            productList[index]["brand"]=value!;
                            if(productList[index]["brand"]=="oppo")
                            {
                              productList[index]["image"]="assets/image/4.png";
                            }
                          });
                        },),
                        const Text("Oppo",style: TextStyle(color: Colors.white),),
                        Radio(activeColor:Colors.blue,value: "Nokia", groupValue: productList[index]["brand"], onChanged: (value) {
                          setState(() {
                            productList[index]["brand"]=value!;
                            if(productList[index]["brand"]=="Nokia")
                            {
                              productList[index]["image"]="assets/image/5.png";
                            }
                          });
                        },),
                        const Text("Nokia",style: TextStyle(color: Colors.white),),
                        const Spacer(),
                        IconButton(onPressed: () {
                          setState(() {
                            productList.removeAt(index);
                          });
                        }, icon: const Icon(Icons.delete_forever,color: Colors.red),)


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
              "name":"","price":0,"image":"assets/image/0.png","net_q":0,"brand":"","nameText":TextEditingController(),"priceText":TextEditingController(),"nText":TextEditingController(),"dateText":TextEditingController(),"date":"",
            });
          });

        }, child: const Text("+ Add Products")),
        const SizedBox(height: 20,),
        ElevatedButton(onPressed: () {
          setState(() {
            for(int i=0;i<productList.length;i++)
            {
              productList[i]["name"]=productList[i]["nameText"].text;
              productList[i]["price"]=int.parse("${productList[i]["priceText"].text}");
              productList[i]["net_q"]=int.parse("${productList[i]["nText"].text}");
              productList[i]["date"]=productList[i]["dateText"].text;
            }
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Your Data Is Updated",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),  shape: Border.fromBorderSide(BorderSide(width: 12,color: Colors.white70)),backgroundColor: Colors.white,));
          });
        }, child: const Text("Submit")),
        ElevatedButton(onPressed: () {
          setState(() {
            index=0;
          });
        }, child: const Text("Previous"))
      ],
    );
  }
}

