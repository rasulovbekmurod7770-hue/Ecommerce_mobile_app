import 'package:clothing_app_ui/features/auth/cubit/auth_state.dart';
import 'package:clothing_app_ui/features/auth/models/auth_model.dart';
import 'package:clothing_app_ui/features/auth/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit() : super(const AuthInitial());

  Future<void> createUser(AuthModel user) async {
    emit(const AuthLoading());
    try {
      final newUser = AuthRepo().createUser(user);
      emit(AuthOperationSucces(massage: "post successfully created "));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}