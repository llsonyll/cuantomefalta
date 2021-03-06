import 'package:flutter_bloc/flutter_bloc.dart';

import '../constantes.dart';

class NotaObjetivoCubit extends Cubit<double> {
  NotaObjetivoCubit() : super(notaObjetivoMinima);

  void incrementarNotaObjetivo() {
    if (state >= notaObjetivoMinima && state < notaMaxima) {
      emit(state + 1);
    } else {
      emit(state);
    }
  }

  void decrementarNotaObjetivo() {
    if (state > notaObjetivoMinima && state <= notaMaxima) {
      emit(state - 1);
    } else {
      emit(state);
    }
  }
}
