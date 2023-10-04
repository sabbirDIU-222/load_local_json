import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //List? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Load local JSON'),
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('load_json/mydata.json'),
        builder: (context, snapshot) {
         var mydata = json.decode(snapshot.data.toString());

         return ListView.builder(itemBuilder: (context, index) {
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    Text('name :'+mydata[index]['name']),
                    Text('age :' +mydata[index]['age']),
                    Text('skill :' +mydata[index]['skill']),
                ],
              ),
            );
         },
           itemCount: mydata == null ? 0 : mydata.length,
         );
        },
      ),
    );
  }
}

