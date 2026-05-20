import 'package:flutter/material.dart';

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
  final String massage;
  const SignInSuccess({required this.massage});
}

class SignInFailure extends SignInState {
  final String errorMessage;
  SignInFailure({required this.errorMessage});
}

class TokenChecking extends SignInState {
  const TokenChecking();
}

class TokenExists extends SignInState {
  const TokenExists();
}

class TokenNotFound extends SignInState {
  const TokenNotFound();
}