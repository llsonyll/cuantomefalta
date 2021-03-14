import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthStatus {
  guess_user,
  auth_user,
}

class StartCubit extends Cubit<AuthStatus> {
  StartCubit() : super(null);

  // void get StartCubit => false;
  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(AuthStatus.auth_user);
  }
}
