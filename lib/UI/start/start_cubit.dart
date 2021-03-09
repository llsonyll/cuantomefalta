import 'package:flutter_bloc/flutter_bloc.dart';

class StartCubit extends Cubit<bool> {
  StartCubit() : super(false);

  // void get StartCubit => false;
  Future<void> switchTheme(bool isDark) async {
    await Future.delayed(const Duration(seconds: 2));
    emit(!isDark);
  }
}
