import 'package:flutter/material.dart';

import 'Myhomepage.dart';

class Frontpage extends StatefulWidget {
  const Frontpage({super.key});

  @override
  State<Frontpage> createState() => _FrontpageState();
}

class _FrontpageState extends State<Frontpage> {
  void initState() {
    super.initState();
    _showFrontPage(); // Added this line to show the front page initially
  }

  Future<void> _showFrontPage() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(title: '',)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 1000,
        decoration: BoxDecoration(
          
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xff5bb0ff), Color(0xfffff61ef)],
          ),
        ),
        child:  Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 350,),
                Text("",style: TextStyle(fontFamily: "Fredoka",color: Colors.white,fontSize: 40,decoration: TextDecoration.none),),
                Text("WELCOME",style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white,fontSize: 40,decoration: TextDecoration.none),),
                Text("",style: TextStyle(fontFamily: "Fredoka",color: Colors.white,fontSize: 40,decoration: TextDecoration.none),),
                
              ],
            ),
          ),
        )),
      
    );
  }
}
