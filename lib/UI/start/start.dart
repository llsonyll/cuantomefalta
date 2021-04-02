import 'package:flutter/material.dart';

import '../constantes.dart';
import '../home/home_cuanto_me_falta.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: size.height * .2,
            color: Colors.transparent,
          ),
          const SizedBox(height: 20),
          Icon(Icons.gamepad_rounded, size: 100.0, color: Colors.white),
          const SizedBox(height: 20),
          Text(
            'Cuanto Me Falta?',
            style: mainTitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Calcula cuanto te falta\npara aprobar...',
            style: subTitulo,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 60,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeCuantoMeFalta()));
              },
              child: Text('Iniciar'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
