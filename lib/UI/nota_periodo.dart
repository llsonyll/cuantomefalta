import 'package:cuantomefalta/UI/nota_periodo_cubit.dart';
import 'package:cuantomefalta/data/periodo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/home_cubit.dart';
import 'home/periodos_cubit.dart';

class NotaPeriodo extends StatelessWidget {
  const NotaPeriodo({
    Key key,
    this.nroPeriodo = 1,
    @required this.notaDePeriodo,
  }) : super(key: key);

  final int nroPeriodo;
  final NotadePeriodo notaDePeriodo;

  void sumarPeso(BuildContext context, int peso) {
    switch (peso) {
      case 0:
        context.read<SumaPesosCubit>().incrementarPeso();
        break;
      case 1:
        context.read<SumaPesosCubit>().incrementarPeso();
        break;
      case 2:
        context.read<SumaPesosCubit>().incrementarPeso();
        break;
      case 3:
        context.read<SumaPesosCubit>().incrementarPeso();
        break;
      case 4:
        context.read<SumaPesosCubit>().incrementarPeso();
        break;
      default:
        print(peso);
    }
  }

  void restarPeso(BuildContext context, int peso) {
    switch (peso) {
      case 1:
        context.read<SumaPesosCubit>().restarPeso();
        break;
      case 2:
        context.read<SumaPesosCubit>().restarPeso();
        break;
      case 3:
        context.read<SumaPesosCubit>().restarPeso();
        break;
      case 4:
        context.read<SumaPesosCubit>().restarPeso();
        break;
      case 5:
        context.read<SumaPesosCubit>().restarPeso();
        break;
      default:
        print(peso);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotaPeriodoCubit()),
        BlocProvider(create: (context) => PesoPeriodoCubit()),
      ],
      child: BlocBuilder<PesoPeriodoCubit, int>(
        builder: (context, pesoPeriodo) {
          return BlocBuilder<NotaPeriodoCubit, double>(
            builder: (context, notaPeriodo) {
              return ListTile(
                onTap: () {
                  context.read<PeriodosCubit>().verDetallesPeriodo(nroPeriodo);
                },
                tileColor: Colors.blue[100],
                // shape: RoundedRectangleBorder(),
                title: Text('Periodo: $nroPeriodo'),
                subtitle: Row(
                  children: [
                    Text(
                      'Peso asignado',
                    ),
                    IconButton(
                      // splashColor: Colors.blue,
                      // splashRadius: 10.0,
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {
                        context.read<PesoPeriodoCubit>().reducirPesoPeriodo();
                        restarPeso(context, pesoPeriodo);
                      },
                    ),
                    Text(pesoPeriodo.toString()),
                    // Text('${pesoPeriodo + 1}'),
                    IconButton(
                      icon: Icon(Icons.add_circle),
                      onPressed: () {
                        context
                            .read<PesoPeriodoCubit>()
                            .incrementarPesoPeriodo();
                        sumarPeso(context, pesoPeriodo);
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          // splashColor: Colors.blue,
                          // splashRadius: 10.0,
                          icon: Icon(Icons.remove_circle),
                          onPressed: () {
                            context
                                .read<NotaPeriodoCubit>()
                                .reducirNotaPeriodo(context);
                            context
                                .read<SumaNotasCubit>()
                                .restarNota(notaPeriodo);
                          },
                        ),
                        Text(notaPeriodo.toString()),
                        IconButton(
                          icon: Icon(Icons.add_circle),
                          onPressed: () {
                            context
                                .read<NotaPeriodoCubit>()
                                .incrementarNotaPeriodo();
                            context
                                .read<SumaNotasCubit>()
                                .agregarNota(notaPeriodo);
                          },
                        ),
                      ],
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
