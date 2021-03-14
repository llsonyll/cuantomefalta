import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotaPeriodoCubit extends Cubit<double> {
  NotaPeriodoCubit() : super(0);

  void incrementarNotaPeriodo() {
    if (state >= 20) {
      emit(state);
    } else {
      emit(state + 1);
    }
  }

  void reducirNotaPeriodo() {
    if (state <= 0) {
      emit(state);
    } else {
      emit(state - 1);
    }
  }
}

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
}
