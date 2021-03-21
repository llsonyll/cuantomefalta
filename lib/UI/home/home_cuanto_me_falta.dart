import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/periodo.dart';
import 'lista_periodos_cubit.dart';
import 'nota_objetivo_cubit.dart';

class HomeCuantoMeFalta extends StatelessWidget {
  const HomeCuantoMeFalta({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ListaPeriodosCubit()..init()),
        BlocProvider(create: (context) => NotaObjetivoCubit()),
      ],
      child: BlocBuilder<ListaPeriodosCubit, List<Periodo>>(
        builder: (context, listaPeriodos) {
          final notaPromedio =
              context.read<ListaPeriodosCubit>().calcularPromedioNotas;
          return BlocBuilder<NotaObjetivoCubit, double>(
            builder: (context, notaObjetivo) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('Calcula cuanto te falta..'),
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: double.infinity,
                      height: size.height * .1,
                      color: Colors.purple,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Que nota quieres?'),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove_circle),
                              onPressed: () {
                                context
                                    .read<NotaObjetivoCubit>()
                                    .decrementarNotaObjetivo();
                              },
                            ),
                            Text(notaObjetivo.toString()),
                            IconButton(
                              icon: Icon(Icons.add_circle),
                              onPressed: () {
                                context
                                    .read<NotaObjetivoCubit>()
                                    .incrementarNotaObjetivo();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Periodos'),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                context
                                    .read<ListaPeriodosCubit>()
                                    .quitarPeriodo();
                              },
                            ),
                            Text(listaPeriodos.length.toString()),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                context
                                    .read<ListaPeriodosCubit>()
                                    .agregarPeriodo();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: listaPeriodos.length,
                        itemBuilder: (context, index) {
                          final Periodo periodo = listaPeriodos[index];
                          return ListTile(
                            onTap: () {},
                            tileColor: Colors.blue[100],
                            // shape: RoundedRectangleBorder(),
                            title: Text('Periodo: ${periodo.id + 1}'),
                            subtitle: Row(
                              children: [
                                Text(
                                  'Peso asignado: ${periodo.peso}',
                                ),
                                IconButton(
                                  // splashColor: Colors.blue,
                                  // splashRadius: 10.0,
                                  icon: Icon(Icons.remove_circle),
                                  onPressed: () {
                                    context
                                        .read<ListaPeriodosCubit>()
                                        .decrementarPesoPeriodo(periodo);
                                  },
                                ), //
                                IconButton(
                                  icon: Icon(Icons.add_circle),
                                  onPressed: () {
                                    context
                                        .read<ListaPeriodosCubit>()
                                        .incrementarPesoPeriodo(periodo);
                                  },
                                ),
                              ],
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      // splashColor: Colors.blue,
                                      // splashRadius: 10.0,
                                      icon: Icon(Icons.remove_circle),
                                      onPressed: () {
                                        context
                                            .read<ListaPeriodosCubit>()
                                            .decrementarNotaPeriodo(periodo);
                                      },
                                    ),
                                    Text(periodo.nota.toString()),
                                    IconButton(
                                      icon: Icon(Icons.add_circle),
                                      onPressed: () {
                                        context
                                            .read<ListaPeriodosCubit>()
                                            .incrementarNotaPeriodo(periodo);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: size.height * .15,
                      color: notaObjetivo - notaPromedio < .5
                          ? Colors.green
                          : Colors.red,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                                'NotaPromedio: ${notaPromedio.toStringAsFixed(2)}'),
                            Text(
                                'NotaObjetivo: ${notaObjetivo.toStringAsFixed(2)}'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
