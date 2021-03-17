import 'package:cuantomefalta/UI/listTest/listas_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListaTest extends StatelessWidget {
  const ListaTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListaCubit(),
      child: BlocConsumer<ListaCubit, List<ItemLista>>(
        listener: (context, snapshot) {
          print(snapshot);
        },
        builder: (context, snapshot) {
          final cantidadItems = context.read<ListaCubit>().listaState;
          return Scaffold(
            appBar: AppBar(title: Text('ListTest')),
            body: Column(
              children: [
                const SizedBox(height: 20),
                TextButton(
                    onPressed: () {
                      context.read<ListaCubit>().agregarElemento();
                    },
                    child: Text('agregar')),
                const SizedBox(height: 20),
                TextButton(
                    onPressed: () {
                      context.read<ListaCubit>().quitarElemento();
                    },
                    child: Text('quitar')),
                Expanded(
                  child: ListView.builder(
                    itemCount: cantidadItems.length,
                    itemBuilder: (_, index) => Container(
                      color: Colors.purpleAccent[100],
                      height: 100,
                      child: Column(
                        children: [
                          Text(snapshot[index].nombre),
                          Text(snapshot[index].valor.toString()),
                          TextButton(
                            onPressed: () {
                              context
                                  .read<ListaCubit>()
                                  .aumentarValor(snapshot[index].nombre);
                            },
                            child: Text(
                              'aumentar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
