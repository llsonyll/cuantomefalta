import 'package:cuantomefalta/data/periodo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PeriodosCubit extends Cubit<int> {
  PeriodosCubit() : super(1);

  List<NotadePeriodo> listaNotas = [
    NotadePeriodo(id: 0, nota: 0, peso: 1),
  ];

  void agregarPeriodo() {
    if (state != 5) {
      listaNotas.add(NotadePeriodo(id: listaNotas.length, nota: 0, peso: 1));
      emit(state + 1);
    } else {
      emit(state);
    }
  }

  void quitarPeriodo(BuildContext context) {
    if (state == 1) {
      emit(state);
    } else {
      listaNotas.removeLast();
      emit(state - 1);
    }
  }

  void verDetallesPeriodo(int id) {
    for (var periodo in listaNotas) {
      if (periodo.id == id) {
        print(periodo.id);
        print(periodo.nota);
        print(periodo.peso);
      }
    }
  }

  void actualizarPeriodo(NotadePeriodo data) {
    print(data.nota);
    // for (var periodo in listaNotas) {
    //   if (periodo.id == data.id) {
    //     // actualizar ... la pta lista xd
    //   }
    // }
  }
}
