import 'package:clothing_app_ui/features/auth/repo/auth_repo.dart';
import 'package:clothing_app_ui/features/auth/sign_up/models/sign_in_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepo authRepository;

  // Initialize with the Initial state
  SignInCubit({required this.authRepository}) : super(const SignInInitial());

  Future<void> submitSignIn({
    required String email,
    required String password,
  }) async {
    // Tell the UI to show a loading indicator
    emit(const SignInLoading());

    try {
      // 1. Create the model
      final signInModel = SignInModel(
        email: email,
        password: password,
      );

      // 2. Pass the model to the repository
      await authRepository.getUsers(signInModel );

      // 3. If the repository finishes without throwing an error, it's a success!
      emit(SignInSuccess());
      
    } catch (e) {
      // 4. If the repository throws an error, emit failure with the message
      emit(SignInFailure(e.toString()));
    }
  }
}