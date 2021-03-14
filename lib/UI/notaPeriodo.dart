import 'package:cuantomefalta/UI/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/periodos_cubit.dart';

class NotaPeriodo extends StatelessWidget {
  const NotaPeriodo({
    Key key,
    this.nroPeriodo = 1,
    @required this.notaDePeriodo,
  }) : super(key: key);

  final int nroPeriodo;
  final NotadePeriodo notaDePeriodo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotaPeriodoCubit(),
      child: BlocBuilder<NotaPeriodoCubit, double>(
        builder: (context, snapshot) {
          return ListTile(
            tileColor: Colors.deepOrange[50],
            // shape: RoundedRectangleBorder(),
            title: Text('Periodo: $nroPeriodo'),
            subtitle: Text(
              'Peso asignado',
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                        context.read<NotaPeriodoCubit>().reducirNotaPeriodo();
                        context.read<SumaNotasCubit>().restarNota(snapshot);
                      },
                    ),
                    Text(snapshot.toString()),
                    IconButton(
                      icon: Icon(Icons.add_circle),
                      onPressed: () {
                        context
                            .read<NotaPeriodoCubit>()
                            .incrementarNotaPeriodo();
                        context.read<SumaNotasCubit>().agregarNota(snapshot);
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
