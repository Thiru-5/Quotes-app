import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _quote = "";
  String _author = "";
  bool _loading = false;

  Future<http.Response> fetchQuote() async {
    return http.get(Uri.parse('https://zenquotes.io/api/random/'));
  }

  void newQuote() async {
    setState(() => _loading = true
    );
    var res = await fetchQuote();
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      var item = body[0];
      print(item);
      setState(() {
        _quote = item['q'];
        _author = item['a'];
      });
    };
    setState(() => _loading = false );
  }

  @override
  Widget build(BuildContext context) {
    // Bootstrap a new quote
    if (_quote == "") {
      newQuote();
    }

    // Build UI
    return Scaffold(
      appBar: AppBar(title: Text("Quotes of the Day"),backgroundColor: Color(0xffc594e1),),
      body: Container(
        width: 1000,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xff5bb0ff), Color(0xfffff61ef)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 150,),
         if (_loading) Text('Loading...',style: TextStyle(fontStyle: FontStyle.italic,color: Colors.black ,fontSize: 20,decoration: TextDecoration.none)),
             SizedBox(height: 40,),
            Container(
                width: 300,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [ Color(0xfffff61ef),Color(0xff5bb0ff)],
                  ),
                ),
                child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.all(22.0),
                      child: Text(
                        '$_quote',
                        style: TextStyle(fontStyle: FontStyle.italic,color: Colors.black ,fontSize: 20,decoration: TextDecoration.none),
                      )),
                  Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Text(
                        '$_author',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 19,decoration: TextDecoration.none),
                      )),
                ],
              ),
                ),
              ),
              SizedBox(height: 180,),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xff5bb0ff)),
                  elevation: MaterialStateProperty.all(0),),
              
              onPressed: newQuote, child:const Icon(Icons.autorenew))
          ],
        ),
        
       // floatingActionButton: FloatingActionButton(
        //  onPressed: newQuote,
       //   tooltip: 'New Quote',
        //  child: const Icon(Icons.autorenew),
       // ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
