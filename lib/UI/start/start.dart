import 'package:flutter/material.dart';

import '../home/home_cuanto_me_falta.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Cuanto Me Falta?',
            style: TextStyle(fontSize: 56.0, fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomeCuantoMeFalta()));
            },
            child: Text('Home'),
          ),
        ],
      ),
    );
  }
}
