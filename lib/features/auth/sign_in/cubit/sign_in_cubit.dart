import 'package:clothing_app_ui/features/auth/repo/auth_repo.dart';
import 'package:clothing_app_ui/features/auth/sign_in/models/sign_in_model.dart';
// import 'package:clothing_app_ui/features/auth/sign_up/models/sign_in_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepo authRepository;
  SignInCubit({required this.authRepository}) : super(const SignInInitial());
  Future<void> checkToken() async {
    emit(const TokenChecking());
    try {
      final exists = await authRepository.checkToken();
      emit(exists ? const TokenExists() : const TokenNotFound());
    } catch (_) {
      emit(const TokenNotFound());
    }
  }

  Future<void> login(SignInModel dto) async {
    emit(const SignInLoading());
    try {
      await authRepository.login(dto);
      emit(const SignInSuccess(massage: 'Successfully logged in'));
    } catch (e) {
      emit(SignInFailure(errorMessage: e.toString()));
    }
  }
}
