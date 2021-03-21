import 'package:cuantomefalta/UI/constantes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/periodo.dart';

class ListaPeriodosCubit extends Cubit<List<Periodo>> {
  ListaPeriodosCubit() : super([]);

  double get calcularPromedioNotas {
    double pNotas = 0;
    int totalPesos = 0;

    for (var periodo in state) {
      // Calcular el acumulado de los pesos, considerando a cada periodo...
      totalPesos += periodo.peso;
    }

    for (var periodo in state) {
      // Asignarle un peso a la nota con respecto al total de los pesos
      final pesoNota = periodo.peso / totalPesos;
      // Agregar al promedio general > usando la nota y su valor con respecto a su peso en conjunto
      pNotas = pNotas + (periodo.nota * pesoNota);
    }
    return pNotas;
  }

  void init() {
    state.add(Periodo(id: state.length));
    emit(List<Periodo>.from(state));
  }

  void agregarPeriodo() {
    if (state.length < 5) {
      state.add(Periodo(id: state.length));
      emit(List<Periodo>.from(state));
    } else {
      emit(List<Periodo>.from(state));
    }
  }

  void quitarPeriodo() {
    if (state.length > 1) {
      state.removeLast();
      emit(List<Periodo>.from(state));
    } else {
      emit(List<Periodo>.from(state));
    }
  }

  void incrementarNotaPeriodo(Periodo periodo) {
    if (periodo.nota >= notaMinima && periodo.nota < notaMaxima) {
      final index =
          state.indexWhere((periodoState) => periodoState.id == periodo.id);
      state[index] =
          Periodo(id: periodo.id, nota: periodo.nota + 1, peso: periodo.peso);
      emit(List<Periodo>.from(state));
    } else {
      emit(List<Periodo>.from(state));
    }
  }

  void decrementarNotaPeriodo(Periodo periodo) {
    if (periodo.nota > notaMinima && periodo.nota <= notaMaxima) {
      final index =
          state.indexWhere((periodoState) => periodoState.id == periodo.id);
      state[index] =
          Periodo(id: periodo.id, nota: periodo.nota - 1, peso: periodo.peso);
      emit(List<Periodo>.from(state));
    } else {
      emit(List<Periodo>.from(state));
    }
  }

  void incrementarPesoPeriodo(Periodo periodo) {
    if (periodo.peso >= pesoMinimo && periodo.peso < pesoMaximo) {
      final index =
          state.indexWhere((periodoState) => periodoState.id == periodo.id);
      state[index] =
          Periodo(id: periodo.id, nota: periodo.nota, peso: periodo.peso + 1);
      emit(List<Periodo>.from(state));
    } else {
      emit(List<Periodo>.from(state));
    }
  }

  void decrementarPesoPeriodo(Periodo periodo) {
    if (periodo.peso > pesoMinimo && periodo.peso <= pesoMaximo) {
      final index =
          state.indexWhere((periodoState) => periodoState.id == periodo.id);
      state[index] =
          Periodo(id: periodo.id, nota: periodo.nota, peso: periodo.peso - 1);
      emit(List<Periodo>.from(state));
    } else {
      emit(List<Periodo>.from(state));
    }
  }
}
