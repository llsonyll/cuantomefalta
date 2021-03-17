import 'package:flutter_bloc/flutter_bloc.dart';

class ItemLista {
  ItemLista({this.nombre, this.valor});

  final String nombre;
  final int valor;
}

class ListaCubit extends Cubit<List<ItemLista>> {
  ListaCubit() : super([]);

  List<ItemLista> get listaState => state.where((element) => true).toList();

  void agregarElemento() {
    state.add(ItemLista(nombre: 'item ${state.length}', valor: state.length));
    emit(listaState);
  }

  void quitarElemento() {
    state.removeLast();
    emit(listaState);
  }

  void aumentarValor(String nombre) {
    for (var elemento in state) {
      if (elemento.nombre == nombre) {
        elemento = ItemLista(nombre: nombre, valor: 10);
        print(elemento.valor);
        emit(listaState);
      }
    }
  }
}
