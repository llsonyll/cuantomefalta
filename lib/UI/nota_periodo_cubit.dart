import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// NOTA POR PERIODO
class NotaPeriodoCubit extends Cubit<double> {
  NotaPeriodoCubit() : super(0);

  void incrementarNotaPeriodo() {
    if (state >= 20) {
      emit(state);
    } else {
      emit(state + 1);
    }
  }

  void reducirNotaPeriodo(BuildContext context) {
    if (state <= 0) {
      emit(state);
    } else {
      emit(state - 1);
    }
    // context
    //     .read<PeriodosCubit>()
    //     .actualizarPeriodo(NotadePeriodo(id: null, nota: state, peso: null));
  }
}

// PESO POR PERIODO
class PesoPeriodoCubit extends Cubit<int> {
  PesoPeriodoCubit() : super(0);

  void incrementarPesoPeriodo() {
    switch (state) {
      case 0:
        emit(state + 1);
        break;
      case 1:
        emit(state + 1);
        break;
      case 2:
        emit(state + 1);
        break;
      case 3:
        emit(state + 1);
        break;
      case 4:
        emit(state + 1);
        break;
      default:
        emit(state);
    }
  }

  void reducirPesoPeriodo() {
    switch (state) {
      case 1:
        emit(state - 1);
        break;
      case 2:
        emit(state - 1);
        break;
      case 3:
        emit(state - 1);
        break;
      case 4:
        emit(state - 1);
        break;
      case 5:
        emit(state - 1);
        break;
      default:
        emit(state);
    }
  }
}
