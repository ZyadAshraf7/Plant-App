part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class GoogleSignInLoading extends LoginState {}
class GoogleSignInSuccess extends LoginState {}
class GoogleSignInFailed extends LoginState {}
class GoogleSignOut extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginError extends LoginState {}
class FacebookLoginLoading extends LoginState {}
class FacebookLoginSuccess extends LoginState {}
class FacebookLoginError extends LoginState {}


