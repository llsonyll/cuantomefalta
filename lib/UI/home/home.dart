import 'package:cuantomefalta/UI/home/periodos_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../notaPeriodo.dart';
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
      ],
      child: BlocBuilder<PeriodosCubit, int>(
        builder: (context, periodosCubit) {
          return BlocBuilder<NotaObjetivoCubit, int>(
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
                              context.read<PeriodosCubit>().quitarPeriodo();
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
                        nroPeriodo: index + 1,
                        notaDePeriodo:
                            context.read<PeriodosCubit>().listaNotas[index],
                      ),
                    ),
                  ),
                  BlocConsumer<SumaNotasCubit, double>(
                      listener: (context, sumaNotas) {},
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
                                Text(
                                    'Suma de las Notas: ${sumaNotas.toString()}'),
                                Text('Promedio Obtenido'),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            );
          });
        },
      ),
    );
  }
}
