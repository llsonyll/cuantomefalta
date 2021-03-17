import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// SUMATORIA DE LOS NOTAS
class SumaNotasCubit extends Cubit<double> {
  SumaNotasCubit(this.contexto) : super(0);

  BuildContext contexto;

  // final listaNotas = contexto.read<PeriodosCubit>().listaNotas;

  void agregarNota(double notaActual) {
    if (notaActual == 20) {
      emit(state);
    } else {
      emit(state + 1);
    }
  }

  void restarNota(double notaActual) {
    if (notaActual == 0) {
      emit(state);
    } else {
      emit(state - 1);
    }
  }

  void restarNotaPeriodo(double nota) {
    emit(state - nota);
  }
}

// SUMATORIA DE LOS PESOS
class SumaPesosCubit extends Cubit<double> {
  SumaPesosCubit() : super(0);

  // final listaNotas = contexto.read<PeriodosCubit>().listaNotas;

  void incrementarPeso() {
    emit(state + 1);
  }

  void restarPeso() {
    emit(state - 1);
  }
}
