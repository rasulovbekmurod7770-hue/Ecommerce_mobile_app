import 'package:clothing_app_ui/features/auth/sign_up/cubit/sign_up_state.dart';
import 'package:clothing_app_ui/features/auth/sign_up/models/sign_up_model.dart';
import 'package:clothing_app_ui/features/auth/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const AuthInitial());

  Future<void> createUser(SignUpModel user) async {
    emit(const AuthLoading());
    try {
      final newUser = AuthRepo().createUser(user);
      emit(AuthOperationSucces(massage: "post successfully created "));
      print("all good");
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
