import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cuanto Me Falta? v.1',
      theme: ThemeData.light(),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Cuanto Me Falta?',
          style: TextStyle(fontSize: 56.0, fontWeight: FontWeight.w800),
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
