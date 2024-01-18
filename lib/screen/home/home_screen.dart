import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
          body:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Go To",style: TextStyle(color: Colors.yellow,fontSize: 22),),
                        const Text("User Input Details Screen",style: TextStyle(color: Colors.yellow,fontSize: 22),),
                        InkWell(onTap: () => setState(() {
                          Navigator.pushNamed(context, "getter");
                        }),
                            child: const Text("Click Here >",style: TextStyle(color: Colors.yellow,fontSize: 22,decoration: TextDecoration.underline,decorationColor: Colors.red,decorationThickness: 1.4),)),
                      ],
            ),
          )),
    );
  }
}
