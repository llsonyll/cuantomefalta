import 'package:flutter/material.dart';

import 'UI/start/start.dart';

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
