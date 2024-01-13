import 'package:flutter/material.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Future.delayed(const Duration(seconds: 3),() =>  Navigator.pushReplacementNamed(context, "home"),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image.asset(
                "assets/logo/logo1.png",
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 10,),
            const Text("Invoice_Maker",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
