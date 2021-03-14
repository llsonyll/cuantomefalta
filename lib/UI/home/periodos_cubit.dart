import 'package:flutter_bloc/flutter_bloc.dart';

class PeriodosCubit extends Cubit<int> {
  PeriodosCubit() : super(1);

  List<NotadePeriodo> listaNotas = [
    NotadePeriodo(nota: 0, peso: 1),
  ];

  void agregarPeriodo() {
    if (state != 5) {
      listaNotas.add(NotadePeriodo(nota: 0, peso: 1));
      emit(state + 1);
    } else {
      emit(state);
    }
  }

  void quitarPeriodo() {
    if (state == 1) {
      emit(state);
    } else {
      listaNotas.removeLast();
      emit(state - 1);
    }
  }
}

class NotadePeriodo {
  NotadePeriodo({this.nota, this.peso});

  final double nota;
  final double peso;
}
