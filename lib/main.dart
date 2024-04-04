import 'package:flutter/material.dart';

import 'package:sample/Frontpage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your Quote',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Frontpage(),
    );
  }
}

