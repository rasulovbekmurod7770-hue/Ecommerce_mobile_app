import 'package:clothing_app_ui/features/auth/models/auth_model.dart';

abstract class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}

final class AuthLoaded extends AuthState {
  final List<AuthModel> users;

  AuthLoaded({required this.users});
}

final class AuthOperationSucces extends AuthState {
  final String massage;

  AuthOperationSucces({required this.massage});
}
