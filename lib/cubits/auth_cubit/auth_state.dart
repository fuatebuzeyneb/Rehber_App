part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {}

final class SignUpFailure extends AuthState {
  final String errorMsg;

  SignUpFailure(this.errorMsg);
}

final class SignInLoading extends AuthState {}

final class SignInSuccess extends AuthState {}

final class SignInFailure extends AuthState {
  final String errorMsg;

  SignInFailure(this.errorMsg);
}

final class ForgotPasswordLoading extends AuthState {}

final class ForgotPasswordSuccess extends AuthState {}

final class ForgotPasswordFailure extends AuthState {
  final String errorMsg;

  ForgotPasswordFailure(this.errorMsg);
}

final class TermsAndConditionUpdateCheckVoxState extends AuthState {}

final class ObscurePasswordTextUpdateState extends AuthState {}
