import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/periodo.dart';
import '../constantes.dart';
import 'lista_periodos_cubit.dart';
import 'nota_objetivo_cubit.dart';

class HomeCuantoMeFalta extends StatelessWidget {
  const HomeCuantoMeFalta({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

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
              final aprobadoDesaprobado = notaObjetivo - notaPromedio <= .5;
              return Scaffold(
                backgroundColor: Colors.grey[200],
                appBar: AppBar(
                  title: Text('Calcula cuanto te falta..'),
                  backgroundColor: Colors.black,
                  centerTitle: true,
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Container(
                    //   width: double.infinity,
                    //   height: size.height * .1,
                    //   color: Colors.grey,
                    // ),
                    Card(
                      elevation: 5.0,
                      margin: const EdgeInsets.all(0),
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Que nota quieres?',
                                  style: textos.copyWith(color: Colors.black),
                                ),
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
                                    Text(
                                      notaObjetivo.toString(),
                                      style: subTitulo.copyWith(
                                          color: Colors.black),
                                    ),
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
                                Text(
                                  'Ciclos/Unidades',
                                  style: textos.copyWith(color: Colors.black),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove_circle),
                                      onPressed: () {
                                        context
                                            .read<ListaPeriodosCubit>()
                                            .quitarPeriodo();
                                      },
                                    ),
                                    Text(
                                      listaPeriodos.length.toString(),
                                      style: subTitulo.copyWith(
                                          color: Colors.black),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add_circle),
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
                          ],
                        ),
                      ),
                    ),
                    // const SizedBox(height: 10.0),
                    Expanded(
                      child: ListView.builder(
                        itemCount: listaPeriodos.length,
                        itemBuilder: (context, index) {
                          final Periodo periodo = listaPeriodos[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 8.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(borderRadius),
                            ),
                            elevation: 2.0,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(borderRadius),
                                        bottomLeft:
                                            Radius.circular(borderRadius),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Peso',
                                            style: textos,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                // splashColor: Colors.blue,
                                                // splashRadius: 10.0,
                                                icon: Icon(
                                                  Icons.remove_circle,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  context
                                                      .read<
                                                          ListaPeriodosCubit>()
                                                      .decrementarPesoPeriodo(
                                                          periodo);
                                                },
                                              ), //
                                              Text(
                                                '${periodo.peso}',
                                                style: subTitulo.copyWith(
                                                    color: Colors.black),
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.add_circle,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  context
                                                      .read<
                                                          ListaPeriodosCubit>()
                                                      .incrementarPesoPeriodo(
                                                          periodo);
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Column(
                                      children: [
                                        Text('Ciclo/Unidad: ${periodo.id + 1}'),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                    .decrementarNotaPeriodo(
                                                        periodo);
                                              },
                                            ),
                                            Text(
                                              periodo.nota.toString(),
                                              style: subTitulo.copyWith(
                                                  color: Colors.black),
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.add_circle),
                                              onPressed: () {
                                                context
                                                    .read<ListaPeriodosCubit>()
                                                    .incrementarNotaPeriodo(
                                                        periodo);
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      width: double.infinity,
                      color: aprobadoDesaprobado ? Colors.green : Colors.red,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${notaPromedio.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 48.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              'Nota Objetivo: ${notaObjetivo.toStringAsFixed(2)}',
                              style: textos.copyWith(
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              aprobadoDesaprobado ? 'Aprobado' : 'Desaprobado',
                              style: subTitulo,
                            ),
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
