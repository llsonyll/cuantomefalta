import 'package:flutter_bloc/flutter_bloc.dart';

class NotaObjetivoCubit extends Cubit<int> {
  NotaObjetivoCubit() : super(14);

  void incrementarNotaObjetivo() {
    if (state >= 20) {
      emit(state);
    } else {
      emit(state + 1);
    }
  }

  void reducirNotaObjetivo() {
    if (state <= 14) {
      emit(state);
    } else {
      emit(state - 1);
    }
  }
}
