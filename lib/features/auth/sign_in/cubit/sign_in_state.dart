abstract class SignInState {
  const SignInState();
}

class SignInInitial extends SignInState {

  const SignInInitial();
}

class SignInLoading extends SignInState {
  const SignInLoading();
}

class SignInSuccess extends SignInState {
  const SignInSuccess();
}

// 4. Failure State: Show a red error message or SnackBar
class SignInFailure extends SignInState {
  final String errorMessage;

  SignInFailure(this.errorMessage);
}