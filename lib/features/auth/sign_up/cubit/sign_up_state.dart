import 'package:clothing_app_ui/features/auth/sign_up/models/sign_up_model.dart';

abstract class SignUpState {
  const SignUpState();
}

final class AuthInitial extends SignUpState {
  const AuthInitial();
}

final class AuthLoading extends SignUpState {
  const AuthLoading();
}

final class AuthError extends SignUpState {
  final String message;

  AuthError({required this.message});
}

final class AuthLoaded extends SignUpState {
  final List<SignUpModel> users;

  AuthLoaded({required this.users});
}

final class AuthOperationSucces extends SignUpState {
  final int userId;

  AuthOperationSucces({required this.userId});
}
