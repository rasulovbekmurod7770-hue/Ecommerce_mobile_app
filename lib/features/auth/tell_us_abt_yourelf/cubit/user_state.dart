
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final String massage;

  UserSuccess(this.massage);
}

class UserError extends UserState {
  final String message;

  UserError(this.message);
}
