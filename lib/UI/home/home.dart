import 'package:cuantomefalta/UI/home/periodos_cubit.dart';
import 'package:cuantomefalta/UI/listTest/listas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../nota_periodo.dart';
import 'home_cubit.dart';
import 'nota_objetivo_cubit.dart';

class Calculadora extends StatelessWidget {
  const Calculadora({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotaObjetivoCubit()),
        BlocProvider(create: (context) => PeriodosCubit()),
        BlocProvider(create: (context) => SumaNotasCubit(context)),
        BlocProvider(create: (context) => SumaPesosCubit()),
      ],
      child: BlocBuilder<PeriodosCubit, int>(
        builder: (context, periodosCubit) {
          return BlocBuilder<NotaObjetivoCubit, int>(
              builder: (context, notaObjetivo) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Calcula cuanto te falta..'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => ListaTest()));
                      },
                      child: Text('sgte')),
                ],
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height * .1,
                    color: Colors.purple,
                  ),
                  // TextField(
                  //   controller:
                  //       context.read<CantidadPeriodosCubit>().nombreCurso,
                  //   decoration: InputDecoration(
                  //     hintText: 'Curso(opcional)',
                  //     labelText: 'Nombre del Curso',
                  //   ),
                  // ),
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
                                  .reducirNotaObjetivo();
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
                                  .read<PeriodosCubit>()
                                  .quitarPeriodo(context);
                              // context.read<PeriodosCubit>().verUltimo();
                            },
                          ),
                          Text(periodosCubit.toString()),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              context.read<PeriodosCubit>().agregarPeriodo();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: periodosCubit,
                      itemBuilder: (_, index) => NotaPeriodo(
                        nroPeriodo: index,
                        notaDePeriodo:
                            context.read<PeriodosCubit>().listaNotas[index],
                      ),
                    ),
                  ),
                  BlocBuilder<SumaPesosCubit, double>(
                    builder: (context, sumaPesos) {
                      return BlocBuilder<SumaNotasCubit, double>(
                        builder: (context, sumaNotas) {
                          return Container(
                            width: double.infinity,
                            height: size.height * .15,
                            color: sumaNotas / periodosCubit >= notaObjetivo
                                ? Colors.green
                                : Colors.red,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('${sumaNotas / periodosCubit}'),
                                  Text(sumaPesos.toString()),
                                  Text(
                                      'Suma de las Notas: ${sumaNotas.toString()}'),
                                  Text('Promedio Obtenido'),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          });
        },
      ),
    );
  }
}
